<cfoutput>
<div class="media" id="comment_#comment.getCommentID()#">
    #cb.quickAvatar( author=comment.getAuthorEmail(), size=60 )#
    <div class="media-body ml-3">
        <div class="media-heading">
        	<h6 class="mb-1">#comment.getAuthor()#</h6> 
        	<small>#dateFormat(comment.getDisplayCreatedDate(),"dd mmm yyyy" )#</small>
        </div>
        <p>#comment.getDisplayContent()#</p>
    </div>
</div>
</cfoutput>