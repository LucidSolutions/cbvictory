<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
<div class="panel panel-default">	
	#cb.widget( "SearchBlog" )#
</div>
</cfif>

<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
<div class="panel panel-default">
	<h5>Categories</h5>
	<!---
	Display Categories using ContentBox collection template rendering
	the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
	--->
	<ul>
		#cb.quickCategories()#		
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
<div class="panel panel-default">
	<h5>Recent Entries</h5>
	#cb.widget( 'RecentPosts' )#
</div>
</cfif>

<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
<!--- RSS Buttons --->
<div class="panel panel-default">
	<h5>Site Updates</h5>
	<ul>
		<li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i> RSS Feed</a></li>
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showArchivesBlogSide", true )>
<div class="panel panel-default">
	<h5>Archives</h5>
	#cb.widget( "Archives" )#
</div>
</cfif>

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>