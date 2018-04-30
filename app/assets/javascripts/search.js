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
      console.log(response.log(response.length));
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

    // append to dom
    return alertMessage;
  }

});
