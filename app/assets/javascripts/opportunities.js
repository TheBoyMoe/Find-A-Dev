document.addEventListener('turbolinks:load', function() {
  let nextProject = document.getElementById('load-next-project');
  if(nextProject) nextProject.addEventListener('click', callback);

  function callback(e){
    e.preventDefault();
    console.log('CLICKED NEXT');

    $.getJSON(e.target.href, (response)=>{
      displayProject(response);
    });
  }

  function displayProject(response){
   let opportunityContainer = document.querySelector('.opportunity-wrap');

	 let opportunity =	
     `<div class="opportunity">
			  <h2>${response.title}</h2>
        <p>${response.description}</p>
		  </div>`;

   if(response.opportunity_skills.length > 0){
      opportunity += 
				`<h3>You will have the following capabilities</h3>
				<dl class="items skills">`;

			response.opportunity_skills.forEach((skill)=>{
				opportunity += 		
        `<dt class="skill-title">${skill.title}</dt>
				<dd class="skill-description">${skill.description}</dd>`
      });
			opportunity += `</dl></div>`;
   }
  
    opportunity += '<div class="author-details"><div class="image">';
		opportunity += '<img src="'+ response.author.main_image.url + '"  class="circle" alt="profile image" >';
		opportunity	+= '</div></div>';


   opportunityContainer.innerHTML = opportunity;
  }

});
