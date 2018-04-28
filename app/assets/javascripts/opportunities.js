document.addEventListener('turbolinks:load', function() {
  document.getElementById('load-next-project').addEventListener('click', callback);

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
  

		// <div class="author-details">
		// 	 <div class="image">
		// 	   <%= image_tag user_avatar(@author.main_image), class: "circle" %>
		// 	 </div>
		// </div>


   opportunityContainer.innerHTML = opportunity;
  }

});
