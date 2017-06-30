package gr.uoa.di.controllers.auth;

import gr.uoa.di.entities.ParentMetadata;
import gr.uoa.di.entities.User;
import gr.uoa.di.forms.auth.ParentRegisterForm;
import gr.uoa.di.repositories.UserRepository;
import gr.uoa.di.services.ParentMetadataService;
import gr.uoa.di.services.SecurityService;
import gr.uoa.di.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.Set;

@Controller
public class ParentRegisterController {
    @Autowired
    private UserService mUserService;

    @Autowired
    private UserRepository repo;

    @Autowired
    private ParentMetadataService mParentMetadataService;

    @Autowired
    private SecurityService mSecurityService;

    @Autowired
    private Validator mValidator;

    @GetMapping("/register/parent")
    public ModelAndView getRegister() {
        ModelAndView mav = new ModelAndView("auth/register_parent");
        mav.addObject("registerForm", new ParentRegisterForm());
        return mav;
    }

    @PostMapping("/register/parent")
    public ModelAndView postRegister(@ModelAttribute("registerForm") ParentRegisterForm registerForm, BindingResult bindingResult, HttpServletRequest request) {
        Set<ConstraintViolation<ParentRegisterForm>> errors = mValidator.validate(registerForm);

        if (!errors.isEmpty()) {
            ModelAndView mav = new ModelAndView("auth/register_parent", bindingResult.getModel());
            mav.addObject("registerForm", registerForm);
            mav.addObject("errors", errors);
            return mav;
        }

        User user = new User();
        user.setEmail(registerForm.getEmail());
        user.setPassword(registerForm.getPassword());
        user.setName(registerForm.getName());
        user.setSurname(registerForm.getSurname());
        user.setEnabled(true);
        user.setRole("ROLE_PARENT");
        user = mUserService.save(user);

        ParentMetadata metadata = new ParentMetadata();
        metadata.setUserId(user.getId());
        metadata.setFirstName(registerForm.getName());
        metadata.setLastName(registerForm.getSurname());
        metadata.setPhone(registerForm.getPhone());
        mParentMetadataService.save(metadata);

        // To autologin, we need to pass the password in plain text.
        String password = registerForm.getPassword();
        mSecurityService.autologin(user.getEmail(), password);

        // registered = 1? Is registered ever 0?
        return new ModelAndView("redirect:/?registered=1");
    }
}