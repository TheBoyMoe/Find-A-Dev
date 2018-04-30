document.addEventListener('turbolinks:load', function() {
  let prevProject = document.getElementById('load-prev-project');
  if(prevProject) prevProject.addEventListener('click', loadProject);
  let nextProject = document.getElementById('load-next-project');
  if(nextProject) nextProject.addEventListener('click', loadProject);

  let userEmail = document.querySelector('body').dataset.useremail;
	let projectCount = parseInt(document.querySelector('body').dataset.projectcount);
	let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  function loadProject(e){
    e.preventDefault();

    $.getJSON(e.target.href, (response)=>{
      displayProject(response);
    });
  }

  function displayProject(response){
    let opportunityContainer = document.querySelector('.opportunity-wrap');

	  let opportunity =	
      `<div class="opportunity">
	   	  <h2 class="page-title">${response.title}</h2>
        <p>${response.description}</p>`;

    // include required skills
    if(response.opportunity_skills.length > 0){
       opportunity += 
	   		`<h3>You will have the following capabilities</h3>
	   		 <dl class="items skills">`;

	   	response.opportunity_skills.forEach((skill)=>{
	   		opportunity += 		
         `<dt class="skill-title">${skill.title}</dt>
	   		  <dd class="skill-description">${skill.description}</dd>`
       });
	   	opportunity += '</dl>';
    }

    opportunity += '</div>';

    // add user avatar
    opportunity += '<div class="author-details"><div class="image">';
	  opportunity += '<img src="'+ response.author.main_image.url + '"  class="circle" alt="profile image" >';
	  opportunity	+= '</div>';


    if(userEmail !== response.author.email){

      // link to users profile
      opportunity += '<div class="author-links clearfix">';
      opportunity += '<p>Check <a href="/users/' + response.author.id  +'">' + response.author.name + '\'s</a> profile</p>';
      opportunity += '<span>&nbsp;or </span>'

      // start a conversation form
			opportunity += '<form action="/conversations" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" />';
			opportunity += '<input type="hidden" name="authenticity_token" value="' + token + '" />';
			opportunity += '<input type="hidden" name="title" id="title" value="'+ response.title +'" />';
			opportunity += '<input type="hidden" name="recipient_id" id="recipient_id" value="'+ response.author.id +'" />';
			opportunity += '<input type="submit" name="commit" value="start a conversation" class="btn-conversation" data-disable-with="start a conversation" /></form>';

      opportunity += '</div>';
    }

    opportunity += '</div>';

    opportunityContainer.innerHTML = opportunity;
	
    let btnContainer = document.createElement('div');
    btnContainer.setAttribute('id', 'project-nav');
    btnContainer.setAttribute('class', 'clearfix');

    // link to next project
    if(response.id < projectCount){
      let next = document.createElement('a');
      let text = document.createTextNode('Next');
      next.appendChild(text);
      next.setAttribute('id', 'load-next-project');
      next.setAttribute('href', '/opportunities/' + (response.id + 1));
      next.addEventListener('click', loadProject);
      btnContainer.append(next);
    }

    // link to prev project
    if(response.id - 1 > 0){
      let prev = document.createElement('a');
      let text = document.createTextNode('Prevous');
      prev.appendChild(text);
      prev.setAttribute('id', 'load-prev-project');
      prev.setAttribute('href', '/opportunities/' + (response.id - 1));
      prev.addEventListener('click', loadProject);
      btnContainer.append(prev);
    }
    opportunityContainer.append(btnContainer);
  }

});
