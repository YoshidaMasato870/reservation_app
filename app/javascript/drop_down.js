document.addEventListener('turbolinks:load', function() {
      const dropdownContainer = document.getElementById('dropdownContainer');
      const dropdownMenu = document.getElementById('dropdownMenu');
    
        dropdownContainer.addEventListener('click', function() {
          if (dropdownMenu.style.display == 'none'){
          dropdownMenu.style.display = 'block';
          }else{
          dropdownMenu.style.display = 'none';
          }
        });    
})