<cfoutput>
<section class="page-heading">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Blog Detail</h1>
            </div>
        </div>
    </div>
</section>

<!--- Body Main --->
<section id="body-main" class="section-padding-half">
	<div class="container">	
		<div class="row">
			<div class="<cfif args.sidebar>col-md-8 col-lg-9<cfelse>col-md-12 col-lg-12</cfif>">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_preEntryDisplay")#
				
				<div class="blog-item">
			        <cfif prc.entry.getFeaturedImageURL() NEQ "">
		            	<img class="img-fluid" src="#prc.entry.getFeaturedImageURL()#" alt="#prc.entry.getTitle()#">
		            <cfelse>
		            	<img class="img-fluid" src="https://via.placeholder.com/950X550/cccccc/cccccc" alt="#prc.entry.getTitle()#">
					</cfif>
			        <div class="date"> #prc.entry.getDisplayPublishedDate()#</div>
			        <div class="down-content">
			            <h4>#prc.entry.getTitle()#</h4>
			            <span>#cb.quickCategoryLinks(prc.entry)# / #prc.entry.getAuthorName()# <cfif prc.entry.getNumberOfApprovedComments() GT 0>/ #prc.entry.getNumberOfApprovedComments()# Comments</cfif></span>
			            <p>#prc.entry.renderContent()#</p>
			        </div>
			    </div>
				
				<!--- Display Comments --->
				<div id="comments">
					<div class="row">	
						<div class="col-md-12">						
							<h4 class="my-3">#prc.entry.getNumberOfApprovedComments()# Comments</h4>
							#cb.quickComments()#
						</div>				
					</div>
				</div>
				<hr>

				<cfif !args.print>
				<!--- Comment Form: I can build it or I can quick it? --->
				<div id="commentFormShell">
					<div class="row">
						<div class="col-md-12">
							<h4 class="my-3">Leave a comment</h4>
							#cb.quickCommentForm( prc.entry )#
						</div>
					</div>
				</div>
				</cfif>
		
				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#
			</div>
		
			<cfif args.sidebar>
				<div class="col-md-4 col-lg-3" id="blog-sidenav">
					#cb.quickView(view='_blogsidebar', args=args)#
				</div>
			</cfif>
		</div>
	</div>
</section>
</cfoutput>