function replaceImg(text) {
  if (!text) {
    return;
  }
  var reg = RegExp('single-tkmoney"', 'gi')
  text=text.replace(reg, 'single-tkmoney" style="display:none"')
  var reg1 = RegExp('single-tkrates"', 'gi')
  text=text.replace(reg1, 'single-tkrates" style="display:none"')
  var reg2 = RegExp('commodity-tkmoney"','gi')
  text=text.replace(reg2, 'commodity-tkmoney" style="display:none"')
  var reg3 = RegExp('commodity-tkrates"','gi')
  text=text.replace(reg3, 'commodity-tkrates" style="display:none"')
  var reg4 = RegExp('id="','gi')
  text=text.replace(reg4, 'data-hh="456" id="')
  
  return text
}

module.exports.replaceImg = replaceImg;