/* Author: 

*/
function checkKey(e){
  var keycode = $.browser.ie ? e.KeyCode : e.which;
  switch (keycode){
    case 39: alert('right: next');break;
    case 37: alert('left: previous (should we implement this?)'); break;
    case 32: alert('You pressed whitespace!!'); break;
    case 49: alert('按1表示一分鐘內看過'); break
    case 50: alert('按2表示五分鐘內看過'); break
    case 51: alert('按3表示十分鐘內看過'); break
    }
}




$(function(){

if ($.browser.mozilla){
  $(document).keypress (checkKey);
} else {
  $(document).keydown (checkKey);
}

});



















