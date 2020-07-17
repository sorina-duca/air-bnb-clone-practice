const initModalProfilePage = () => {
  document.getElementById('profile-avatar').addEventListener('click',
  function(){
    document.querySelector('.bg-modal').style.display = "flex";
  });

  document.querySelector('.close').addEventListener('click',
  function() {
    document.querySelector('.bg-modal').style.display = "none";
  });
}

export { initModalProfilePage };
