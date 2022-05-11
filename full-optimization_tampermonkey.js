// ==UserScript==
// @name        Zerohazard's Font Script
// @namespace   Violentmonkey Scripts
// @match       *://*/*
// @grant       none
// @author      Zerohazard
// @match        http://*/*
// @match        https://*/*
// @match        http://*
// @match        https://*
// @match        *
// ==/UserScript==

(function() {
  'use strict';

  var a;
  var b = 0;

  var x;
  var y = 0;
  var regex = '/Andika|Lexend|Uniqlo|sst|YouTube|YT|speedee|Twitter|spotify|Samsung|Netflix|Amazon|CNN|adobe|intel|Reith|knowledge|abc|Yahoo|VICE|Google|GS Text|Android|bwi|Market|Razer|peacock|zilla|DDG|Bogle|tpu|ArtifaktElement|LG|GeForce|Sky|F1|Indy|Guardian|nyt|Times|Beaufort for LOL|MB|SF|Inter|Adelle|Barlow|Roboto|Avenir|Raleway|Proxima|Gotham|Futura|IBM|Clear Sans|Karla|Work Sans|Segoe|Selawik|WeblySleek|Commissioner|Oxygen|Myriad|Lucida|Lato|Nunito|Whitney|Motiva|Montserrat|PT|Fira|Ubuntu|Source|Noto|Open Sans|Droid Sans|Museo|DIN|Keiner|Kenyan Coffee|Oswald|Rubik|Industry|Rajdhani|Saira|Klavika|Chakra Petch|Univers|Franklin|Impact|Impacted|Poppins|Roobert|Circular|Manrope|Benton|Mark|Helvetica|Archivo|Sora|Interstate|Helmet|Arial|Arimo|Rodin|Hiragino|Yu|Gothic A1|Yantramanav|Komika|Bitter|Playfair|Lora|Linux|Shippori|artifakt|ヒラギノ角ゴ/'
  var runesConst = ",Material Icons Extended, Material Icons, Google Material Icons, Material Design Icons, VideoJS, nexticon";

  function addStyleString(str) {
    var node = document.createElement('style');
    node.innerHTML = str;
    document.body.appendChild(node);
  }

  function zeroStyle(param) {
    while (x != 1 && y <= 1) {
      var font = window.getComputedStyle(document.getElementsByTagName(param)[y]).getPropertyValue("font-family");
      if (typeof(font) != 'undefined' && font != null) {
        if (`${regex}.test(font)`) {
          x = 1;
          var font = font + runesConst;
          var runesElement = document.getElementsByTagName('i')[y];
          if (typeof(runesElement) != 'undefined' && runesElement != null) {
            var runes = window.getComputedStyle(document.getElementsByTagName('i')[y]).getPropertyValue("font-family");
            var font = font + "," + runes;
          }
          var runesElement = document.getElementsByTagName('span')[y];
          if (typeof(runesElement) != 'undefined' && runesElement != null) {
            var runes = window.getComputedStyle(document.getElementsByTagName('span')[y]).getPropertyValue("font-family");
            var font = font + "," + runes;
          }
          addStyleString(`* { font-family: ${font} !important }`);
          return;
        } else {
          y++;
        }
      }
    }
  }

  addStyleString(`* { font-variant-ligatures: normal !important }`);
  addStyleString(`* { font-variant-numeric: lining-nums !important; font-feature-settings: "lnum" !important; }`);
  
  zeroStyle('h3');
  var x;
  var y = 0;
  zeroStyle('h2');
  var x;
  var y = 0;
  zeroStyle('h1');
  var x;
  var y = 0;
  zeroStyle('p');
  

})();
