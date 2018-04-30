document.addEventListener('turbolinks:load', function(){
  let form = document.querySelector('form.search-submit');
  if(form) form.addEventListener('submit', searchHandler);
  let query = null;
  
  function searchHandler(e){
    let action = e.target.action;
    query = e.target.search.value;

    $.get({
      url: action,
      data: { search: query },
      dataType: 'json',
      success: displayResults
    });
    form.reset();
    e.preventDefault();
  }

  function displayResults(response){
    // check no of records returned
    if(response.length > 0){
      let htmlString = '';
      response.forEach((user)=>{
        htmlString += listItem(user);
      });
      document.getElementById('dev-list').innerHTML = htmlString;
      // set query string
      let queryFragment = document.createRange().createContextualFragment(`<p class="query">Results for: ${ query }</p>`);
      document.querySelector('.search-wrap').insertBefore(queryFragment, form);
    } else {
      let container = document.getElementById('container');
      let resultsList = document.getElementById('content-wrap');
      let domFragment = document.createRange().createContextualFragment(createAlertMessage());
      container.insertBefore(domFragment, resultsList);
    }
  }

  function createAlertMessage(){
    let alertMessage =
	    `<div class="row">
		    <div class="col-xs-12">
				  <div class="alert alert-warning alert-dismissible" role="alert">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				    No matches found.	
				  </div>
		    </div>
	    </div>`;

    return alertMessage;
  }

  function listItem(user){
	  return `<li class="item user">
					<div class="contents-wrap clearfix">
						<div class="profile">
							<div class="image">
								<img src="${user.main_image.url}" class="circle">
							</div>
							<div class="details">
								<h3><a href="/users/${user.id}">${ user.name.toUpperCase() }</a></h3>
								<p>${ user.email }</p>
							  ${ displayLinks(user.social_links) }
              </div>
						</div>
						<div class="contents">
							<div class="bio-wrap">
								<p class="bio">
									<i class="fa fa-quote-left" aria-hidden="true"></i>
									 ${ user.bio }
									<i class="fa fa-quote-right" aria-hidden="true"></i>
								</p>
								<a href="/users/${user.id}">Read more</a>
							</div>
						</div>
					</div>
				</li>`;
  }

  function displayLinks(links){
		let linkString = '';
    if(links){
				linkString += '<div>';
				links.forEach((link)=>{
					linkString += `<a href="${ link.url }" target="_blank" class="link_icon">
						              <i class="fa fa-2x fa-${ link.name.downcase }"></i>
					               </a>`;
							
        });
				linkString +=	'</div>';
     }
     return linkString;
  }

});
