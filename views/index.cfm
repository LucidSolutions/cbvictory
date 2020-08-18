<cfoutput>	
<section class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Our Blog</h1>
            </div>
        </div>
    </div>
</section>

<!--- Body Main --->
<section id="body-main" class="section-padding-half">
	<div class="container">	
		<div class="row">
			<!--- Content --->
			<div class="col-md-8 col-lg-9">
		
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preIndexDisplay" )#
					
				<!--- Are we filtering by category? --->
				<cfif len( rc.category )>
					<p class="infoBar h4 mb-3">Category Filtering: '#rc.category#'</p>
					<p class="buttonBar"><a href="#cb.linkBlog()#" class="btn btn-sm btn-secondary" title="Remove filter and view all entries">Remove Filter</a></p>
					<br/>
				</cfif>
		
				<!--- Are we searching --->
				<cfif len( rc.q )>
					<p class="infoBar h4 mb-3">Searching by: '#rc.q#'</p>
					<p class="buttonBar"><a href="#cb.linkBlog()#" class="btn btn-sm btn-secondary" title="Remove filter and view all entries">Clear Search</a></p>
					<br/>
				</cfif>
		
				<!--- Entries displayed here --->
				<div class="row">#cb.quickEntries()#</div>
		
				<!--- Pagination --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>
		
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postIndexDisplay" )#
			</div>
		
			<!--- SideBar --->
			<cfif args.sidebar>
			<div class="col-md-4 col-lg-3" id="blog-sidenav">
				#cb.quickView( view='_blogsidebar', args=args )#
			</div>
			</cfif>
		
		</div>
	</div>
</section>		
</cfoutput>