<cfoutput>
	<footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <p>#cb.themeSetting( 'footerBox' )#</p>
                </div>
                <div class="col-md-4">
                    <ul class="social-icons">
						<li><a href="#cb.themeSetting( 'facebookUrl' )#"><i class="fab fa-facebook"></i></a></li>
						<li><a href="#cb.themeSetting( 'twitterUrl' )#"><i class="fab fa-twitter"></i></a></li>
						<li><a href="#cb.themeSetting( 'instagramUrl' )#"><i class="fab fa-instagram"></i></a></li>
						<li><a href="#cb.themeSetting( 'rssUrl' )#"><i class="fa fa-rss"></i></a></li>
						<li><a href="#cb.themeSetting( 'dribbbleUrl' )#"><i class="fab fa-dribbble"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <p>Copyright &copy; #YEAR(NOW())# #cb.siteName()#.</p>
                </div>
            </div>
        </div>
    </footer>
</cfoutput>