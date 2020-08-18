<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">

<section class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>#prc.page.getTitle()#</h1>
                <p>#prc.page.getTitle()#</p>
            </div>
        </div>
    </div>
</section>

<!--- ContentBoxEvent --->
#cb.event( "cbui_prePageDisplay" )#

<!--- Body Main --->
<section id="body-main" class="section-padding-half">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!--- Render Content --->
				#prc.page.renderContent()#
	    	</div>
	    </div>
	</div>
</section>

<!--- ContentBoxEvent --->
#cb.event("cbui_postPageDisplay")#
</cfoutput>