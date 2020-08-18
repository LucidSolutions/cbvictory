﻿/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* This widget creates a simple ContentBox search form
*/
component extends="contentbox.models.ui.BaseWidget" singleton{
	
	SearchBlog function init(){
		// Widget Properties
		setName( "SearchBlog" );
		setVersion( "1.0" );
		setDescription( "This widget creates a simple ContentBox search form." );
		setAuthor( "LucidOutsourcing Solutions" );
		setAuthorURL( "https://lucidoutsourcing.com/" );
		setCategory( "Miscellaneous" );
		setIcon( "search" );
		return this;
	}

	/**
	* This widget creates a simple ContentBox search form
	* @type.hint The type of search form: content or blog, default is content
	* @label.hint The label to use, defaults to 'Search for:'
	* @title.hint The title to show before the dropdown or list, defaults to H2
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @placeholder.hint Add a placeholder to the query textfield
	* @querycss.hint The css classes of the textfield query
	* @buttoncss.hint The search button css classes
	* @formcss.hint The form css classes
	*/
	any function renderIt(
		string type="content", 
		string label="Search for", 
		string title="", 
		string titleLevel="2", 
		string placeholder="", 
		string querycss="", 
		string buttoncss="", 
		string formcss="" 
	){
		var rString	= "";
		var event = getRequestContext();

		// Check type
		if( !reFindNoCase( "^(content|blog)$", arguments.type ) ){
			throw( 
				message = "Invalid type for search form", 
				detail 	= "Valid types are: content or blog", 
				type 	= "InvalidSearchType"
			);
		}
		// Action
		var action = cb.linkContentSearch();
		if( arguments.type eq "blog" ){
			action = cb.linkSearch();
		}
		// Check incoming query
		local.q = htmlEditFormat( event.getValue( "q", "" ) );

		// generate recent comments
		saveContent variable="rString"{
			writeOutput('
			#html.startForm( name="searchForm", action=action, class=arguments.formcss )#
			    <div class="form-group">
					#html.textField( name="q", placeholder="Type to search", value=local.q, class="form-control")#
			    </div>
			#html.endForm()#
			');
		}

		return rString;
	}
	
}