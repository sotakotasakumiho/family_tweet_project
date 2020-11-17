$(document).on('turbolinks:load', function(){
  $('.scroll-js').jscroll({
    loadingHtml: 'now loading',
    autoTrigger: true,
    nextSelector: 'a.next',
    contentSelector: '.j-scroll',
    padding: 20,
  });
});