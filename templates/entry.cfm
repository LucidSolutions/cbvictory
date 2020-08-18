<cfoutput>
	<cfif len( cb.themeSetting( 'blogLayout' ) )>
		<cfif cb.themeSetting( 'blogLayout' ) eq 'Two Column'>
			<div class="col-md-12 col-lg-6 mb-4">
		<cfelse>
			<div class="col-md-12 col-lg-12 mb-4">
		</cfif>

			<div class="blog-item">
		        <cfif entry.getFeaturedImageURL() NEQ "">
	            	<a href="#cb.linkEntry(entry)#"><img class="img-fluid" src="#entry.getFeaturedImageURL()#" alt="#entry.getTitle()#"></a>
	            <cfelse>
	            	<a href="#cb.linkEntry(entry)#"><img class="img-fluid" src="https://via.placeholder.com/950X550/cccccc/cccccc" alt="#entry.getTitle()#"></a>
				</cfif>
		        <div class="date">#entry.getDisplayPublishedDate()#</div>
		        <div class="down-content">
		            <h4><a href="#cb.linkEntry(entry)#" title="#entry.getTitle()#">#entry.getTitle()#</a></h4>
		            <span>#cb.quickCategoryLinks(entry)# / #entry.getAuthorName()# <cfif entry.getNumberOfApprovedComments() GT 0>/ #entry.getNumberOfApprovedComments()# Comments</cfif></span>
		            <p>#left(ReReplaceNoCase(entry.renderContent(),"<[^>]*>","","ALL"),120)#...</p>
		            <div class="text-button">
		                <a href="#cb.linkEntry(entry)#">Continue Reading</a>
		            </div>
		        </div>
		    </div>

		</div>
	</cfif>
</cfoutput>