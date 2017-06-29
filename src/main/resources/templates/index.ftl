<#include "layout/default.ftl">

<#macro content>
<!-- Main jumbotron for search area -->
<div class="jumbotron">
    <div class="search_bar_container">
        <form method="GET">
            <div class="panel panel-success">
                <div class="panel-heading">Find an Event near you</div>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group has-feedback">
                            <label for="areasearch">Area Search:</label>
                            <input type="text" class="form-control" id="areasearch" placeholder="ie Zografou"/>
                            <!--i class="form-control-feedback glyphicon glyphicon-map-marker "></i-->
                        </div>
                        <div class="form-group has-feedback">
                            <label for="keywordsearch">Keywords:</label>
                            <input type="text" class="form-control" id="keywordsearch" placeholder="ie Playground"/>
                            <!--i class="glyphicon glyphicon-search  form-control-feedback"></i-->
                        </div>
                        <div class="form-group has-feedback ">
                            <label for="datetimepicker">Datetime:</label>
                            <input type="datetime-local" class="form-control" id="datetimepicker" name="event_date"/>
                            <!--i class="glyphicon glyphicon-calendar form-control-feedback"></i-->
                        </div>
                        <!--div class="form-group has-feedback">
                            <label for="timesearch">Time:</label>
                            <input type="time" name="time" id="timesearch" class="form-control" title="Event time">
                            <!--i class="glyphicon glyphicon-hourglass form-control-feedback"></i>
                        </div-->
                        <div class="form-group has-feedback ">
                            <label for="kiattendeessearch">Kid Attendees:</label>
                            <input type="number" min="1" max="100" id="kiattendeessearch" class="form-control"/>
                            <!--i class="glyphicon glyphicon-sunglasses form-control-feedback"></i-->
                        </div>
                        <div class="form-group has-feedback">
                            <label for="attendeessearch">Adult Attendees:</label>
                            <input type="number" min="1" max="100" id="attendeessearch" class="form-control"/>
                            <!--i class="glyphicon glyphicon-sunglasses form-control-feedback"></i-->
                        </div>
                        <div class="form-group has-feedback">
                            <label for="radiussearch">Area Search Radius:</label>
                            <input type="range" name="rangeInput" min="0" max="100" id="radiussearch"
                                   onchange="updateTextInput(this.value);"/>
                            <input type="text" id="rangeArea" value="50" title="Area radius"/>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success btn-lg pull-right" value="Search Now &raquo"/>
                </div>
            </div>
        </form>
        <!-- fix href -->
        <!--p><a class="btn btn-primary btn-lg" href="" role="button">See Eventents &raquo;</a></p-->
    </div>
</div>

<div class="container">
    <!-- WHAT UP WITH THIS? -->
    <#if registered??>
        <div class="row">
            <div class="col-sm-12">
                <div class="alert alert-success">
                ${registered}
                </div>
            </div>
        </div>
    </#if>
    <!--  -->

    <!-- Example row of columns -->
    <div class="slickClass slider">
        <div>
            <img src="/assets/images/slider/aaa.jpg"/>
            <div class="panel panel-success">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                    mauris
                    condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                    euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>
        <div>
            <img src="/assets/images/slider/ccc.jpg"/>
            <div class="panel panel-success">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                    mauris
                    condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                    euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>
        <div>
            <img src="/assets/images/slider/ddd.jpg"/>
            <div class="panel panel-success">
                <h2>Heading</h2>
                <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula
                    porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
                    ut
                    fermentum massa justo sit amet risus.</p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>
        <div><img src="/assets/images/slider/eee.jpg"/>
            <div class="panel panel-success">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                    mauris
                    condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                    euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>
        <div><img src="/assets/images/slider/sss.jpg"/>
            <div class="panel panel-success">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                    mauris
                    condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                    euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>
        <div><img src="/assets/images/slider/ttt.jpg"/>
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div><img src="/assets/images/slider/zzz.jpg"/>
            <h2>Heading</h2>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis
                euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
    </div>
</div>
</#macro>

<@display_page/>