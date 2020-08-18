<cfoutput>
	<section class="page-heading">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-12">
	                <h1>Search Results</h1>
	                <p>Showing results for: <strong>#cb.getSearchTerm()#</strong></p>
	            </div>
	        </div>
	    </div>
	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#

	<section id="body-main" class="section-padding-half search-section">
		<!--- search Results --->
		<div class="container">
			<!--- Search Results --->
			#cb.getSearchResultsContent()#

			<!--- Search paging --->
			#cb.quickSearchPaging()#
		</div>
	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>