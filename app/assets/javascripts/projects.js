$(document).on('turbolinks:load', function() {
  let userEmail = document.querySelector('body').dataset.useremail;
	let projectCount = parseInt(document.querySelector('body').dataset.projectcount);
	let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  $('#load-prev-project').click(loadProject);
  $('#load-next-project').click(loadProject);

  function loadProject(e){
    e.preventDefault();

    $.getJSON(e.target.href, (response)=>{
      displayProject(response);
    });
  }

  function Project(attributes){
    this.id = attributes.id;
    this.title = attributes.title;
    this.description = attributes.description;
    this.author = new Author(attributes);
    this.skills = (Array.from(attributes.project_skills)).map(attributeHash => new Skill(attributeHash));
  }

  function Skill(attributes){
    this.title = attributes.title;
    this.description = attributes.description;
  }

  function Author(attributes){
    this.id = attributes.author.id;
    this.name = attributes.author.name;
    this.email = attributes.author.email;
    this.avatar = attributes.author.main_image.url;
  }

  Project.prototype.renderProject = function(){
    let html =
      `<div class="project-wrap">
        <div class="project">
	   	    <h2 class="page-title">${this.title}</h2>
          <p>${this.description}</p>`;

    html += this.renderSkills();
    html += '</div>';

    // add user avatar
    html += `<div class="author-details"><div class="image">
	             <img src="${ this.author.avatar }"  class="circle" alt="profile image" >
	           </div>`;

    if(userEmail !== this.author.email){

      // link to users profile
      html += `<div class="author-links clearfix">
                 <p>Check <a href="/users/${ this.author.id }">${ this.author.name }'s</a> profile</p>
                 <span>&nbsp;or </span>`;

      // start a conversation form
			html += `<form action="/conversations" accept-charset="UTF-8" method="post">
                 <input name="utf8" type="hidden" value="&#x2713;" />
			           <input type="hidden" name="authenticity_token" value="${ token }" />
			           <input type="hidden" name="title" id="title" value="${ this.title }" />
			           <input type="hidden" name="recipient_id" id="recipient_id" value="${ this.author.id }" />
			           <input type="submit" name="commit" value="start a conversation" class="btn-conversation" data-disable-with="start a conversation" />
               </form></div>`;
    }
    html += '</div></div>';

    return html;
  };

  Project.prototype.renderSkills = function(){
    let html = '';
    if(this.skills.length > 0){
       html +=
	   		`<h3>You will have the following capabilities</h3>
	   		 <dl class="items skills">`;

	   	 this.skills.forEach((skill)=>{
	   		html +=
         `<dt class="skill-title">${skill.title}</dt>
	   		  <dd class="skill-description">${skill.description}</dd>`
       });
	   	html += '</dl>';
    }
    return html;
  };

  function displayProject(response){
    let project = new Project(response);
    let htmlString = project.renderProject();
    $('.project-wrap').replaceWith(htmlString);

    // add prev/next buttons
    let btnContainer = $('<div id="project-nav" class="clearfix"></div>');

    // link to next project
    if(response.id < projectCount){
      $('<a/>', {
        'id': 'load-next-project',
        'text': 'Next',
        'href': '/projects/' + (response.id + 1),
        click: loadProject
      })
        .appendTo(btnContainer);
    }

    // link to prev project
    if(response.id - 1 > 0){
      $('<a/>', {
        'id': 'load-prev-project',
        'text': 'Previous',
        'href': '/projects/' + (response.id - 1),
        click: loadProject
      })
        .appendTo(btnContainer);
    }

    if(response.id - 1 > 0 || response.id < projectCount){
      $('.project-wrap').append(btnContainer);
    }
  }

});
