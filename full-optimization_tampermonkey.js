// ==UserScript==
// @name        Zerohazard's Font Script
// @author      twitter @Zerohazard8x
// ==/UserScript==

function addStyleString(e){var t=document.createElement("style");t.innerHTML=e,document.body.appendChild(t)}addStyleString(`* { font-variant-ligatures: common-ligatures, contextual !important }`),addStyleString(`* { font-variant-numeric: lining-nums, tabular-nums !important }`),addStyleString(`* { font-feature-settings: "kern", "liga", "clig", "calt", "lnum", "tnum" !important }`),addStyleString(`* { font-kerning: normal !important }`);var a,c,d,b,regex="/Andika|Lexend|Uniqlo|sst|YouTube|YT|speedee|Twitter|spotify|Samsung|Netflix|Amazon|CNN|adobe|intel|Reith|knowledge|abc|Yahoo|VICE|Google|GS|Android|bwi|Market|Razer|peacock|zilla|DDG|Bogle|tpu|Artifakt|LG|GeForce|Sky|F1|Indy|Guardian|nyt|Times|Beaufort|MB|SF|Inter|Adelle|Barlow|Roboto|Avenir|Raleway|Proxima|Gotham|Futura|Plex|Clear|Karla|Work|Segoe|Selawik|WeblySleek|Frutiger|Commissioner|Oxygen|Myriad|Lucida|Lato|Nunito|Whitney|Motiva|Montserrat|PT|Fira|Ubuntu|Source|Noto|Open Sans|Droid Sans|Museo|DIN|Keiner|Coffee|Oswald|Rubik|Industry|Rajdhani|Saira|Klavika|Petch|Univers|Franklin|Tahoma|Verdana|Impact|Impacted|Poppins|Roobert|Circular|Manrope|Benton|Mark|Helvetica|Archivo|Sora|Interstate|Helmet|Arial|Arimo|Rodin|Hiragino|Yu|Gothic|Yantramanav|Komika|Bitter|Playfair|Lora|Linux|Shippori|artifakt|ヒラギノ角ゴ/",runesElement,font,runes="Material Icons Extended, Material Icons, Google Material Icons, Material Design Icons, rtings-icons, VideoJS",preCompute=document.documentElement.innerHTML,compReps=0,compRepsOrig=compReps;`preCompute.contains("<i>") === true`&&(runesElement=document.getElementsByTagName("i")[compReps],typeof runesElement!="undefined"&&runesElement!=null&&(runes=runes+","+window.getComputedStyle(runesElement).getPropertyValue("font-family"))),`preCompute.contains("<button>") === true`&&(runesElement=document.getElementsByTagName("button")[compReps],typeof runesElement!="undefined"&&runesElement!=null&&(runes=runes+","+window.getComputedStyle(runesElement).getPropertyValue("font-family"))),`preCompute.contains("<span>") === true`&&(runesElement=document.getElementsByTagName("span")[compReps],typeof runesElement!="undefined"&&runesElement!=null&&(runes=runes+","+window.getComputedStyle(runesElement).getPropertyValue("font-family")));function runesFunc(){addStyleString(`i { font-family: ${runes}, ${font} !important }`),addStyleString(`button { font-family: ${runes}, ${font} !important }`),addStyleString(`span { font-family: ${runes}, ${font} !important }`)}if(`preCompute.contains("<div>") === true`)for(;a!=1&&compReps<=1;)if(font=window.getComputedStyle(document.getElementsByTagName("div")[compReps]).getPropertyValue("font-family"),`${font} != 'undefined' && ${font} != null && ${regex}.test(font)`){throw addStyleString(`* { font-family: ${font}, ${runes} !important }`),runesFunc(),Error();a=1,compReps=compRepsOrig}else compReps++;if(`preCompute.contains("<h2>") === true`)for(;b!=1&&compReps<=1;)if(font=window.getComputedStyle(document.getElementsByTagName("h2")[compReps]).getPropertyValue("font-family"),`${font} != 'undefined' && ${font} != null && ${regex}.test(font)`){throw addStyleString(`* { font-family: ${font}, ${runes} !important }`),runesFunc(),Error();b=1,compReps=compRepsOrig}else compReps++;if(`preCompute.contains("<h1>") === true`)for(;c!=1&&compReps<=1;)if(font=window.getComputedStyle(document.getElementsByTagName("h1")[compReps]).getPropertyValue("font-family"),`${font} != 'undefined' && ${font} != null && ${regex}.test(font)`){throw addStyleString(`* { font-family: ${font}, ${runes} !important }`),runesFunc(),Error();c=1,compReps=compRepsOrig}else compReps++;if(`preCompute.contains("<p>") === true`)for(;d!=1&&compReps<=1;)if(font=window.getComputedStyle(document.getElementsByTagName("p")[compReps]).getPropertyValue("font-family"),`${font} != 'undefined' && ${font} != null && ${regex}.test(font)`){throw addStyleString(`* { font-family: ${font}, ${runes} !important }`),runesFunc(),Error();d=1,compReps=compRepsOrig}else compReps++
