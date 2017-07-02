package gr.uoa.di.controllers.auth;

import gr.uoa.di.application.Auth;
import gr.uoa.di.entities.ProviderMetadata;
import gr.uoa.di.entities.TaxOffice;
import gr.uoa.di.entities.User;
import gr.uoa.di.forms.auth.ProviderRegisterForm;
import gr.uoa.di.repositories.TaxOfficeRepository;
import gr.uoa.di.services.ProviderMetadataService;
import gr.uoa.di.services.SecurityService;
import gr.uoa.di.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.Set;

@Controller
public class ProviderRegisterController {
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProviderMetadataService providerMetadataService;

    @Autowired
    private TaxOfficeRepository taxOfficeRepository;

    @Autowired
    private Validator validator;

    @GetMapping("/register/provider")
    public ModelAndView getRegister(Model model) {

        ProviderRegisterForm registerForm;
        // If we have flashed data (ie. from a failed validation), pass them into the view.
        if (model.asMap().get("registerForm") != null)
            registerForm = (ProviderRegisterForm) model.asMap().get("registerForm");
        else
            registerForm = new ProviderRegisterForm();

        ModelAndView mav = new ModelAndView("auth/register_provider");
        mav.addObject("registerForm", registerForm);
        mav.addObject("taxOffices", taxOfficeRepository.findAll());
        return mav;
    }

    @PostMapping("/register/provider")
    public String postRegister(@ModelAttribute("registerForm") ProviderRegisterForm registerForm, BindingResult bindingResult, HttpServletRequest request,
                               final RedirectAttributes redirectAttributes) {
        Set<ConstraintViolation<ProviderRegisterForm>> errors = validator.validate(registerForm);

        if (!errors.isEmpty()) {
            redirectAttributes.addFlashAttribute("errors", errors);
            redirectAttributes.addFlashAttribute("registerForm", registerForm);
            return "redirect:/register/provider";
        }

        User user = Auth.createUser(userService, registerForm, "ROLE_PROVIDER");

        TaxOffice taxOffice = taxOfficeRepository.findOne(registerForm.getTaxOfficeId());

        ProviderMetadata metadata = new ProviderMetadata();
        metadata.setUserId(user.getId());
        metadata.setTitle(registerForm.getTitle());
        metadata.setCompanyName(registerForm.getCompanyName());
        metadata.setVatNumber(registerForm.getVatNumber());
        metadata.setTaxOfficesByTaxOfficeId(taxOffice);
        metadata.setPhone(registerForm.getPhone());
        metadata.setFax(registerForm.getFax());
        metadata.setAddress(registerForm.getAddress());
        metadata.setZipCode(registerForm.getZipCode());
        metadata.setRegion(registerForm.getRegion());
        metadata.setCity(registerForm.getCity());
        metadata.setLatitude("");
        metadata.setLongitude("");
        providerMetadataService.save(metadata);

        // To autologin, we need to pass the password in plain text.
        String password = registerForm.getPassword();
        securityService.autologin(user.getEmail(), password);

        return "redirect:/";
    }
}