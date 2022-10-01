// ==UserScript==
// @name        Zerohazard's Font Script
// @author      twitter @Zerohazard8x
// @match       *://*/*
// @grant       GM_addStyle
// @grant       GM_getValue
// @grant       GM_setValue
// @grant       GM_xmlhttpRequest
// ==/UserScript==

for(var preCompute=document.documentElement.innerHTML,regex,runes,killVar,compReps,compRepsLimit,font,segConst,preComputeCheck=document.documentElement.innerHTML;preCompute!=preComputeCheck;){if(preCompute==preComputeCheck&&typeof preCompute!="undefined"&&preCompute!=null)break;preCompute=document.documentElement.innerHTML,preComputeCheck=document.documentElement.innerHTML}if(preCompute.includes("<h2>")===!1&&preCompute.includes("<h1>")===!1&&preCompute.includes("<p>")===!1&&preCompute.includes("<body>")===!1)throw Error();function addStyleString(e){var t=document.createElement("style");t.innerHTML=e,document.body.appendChild(t)}regex="/.*Andika.*|.*Lexend.*|.*Uniqlo.*|.*sst.*|.*YouTube.*|.*YT.*|.*speedee.*|.*Twitter.*|.*spotify.*|.*Samsung.*|.*Netflix.*|.*Amazon.*|.*CNN.*|.*adobe.*|.*intel.*|.*Reith.*|.*knowledge.*|.*abc.*|.*Yahoo.*|.*VICE.*|.*Google.*|.*GS.*|.*Android.*|.*bwi.*|.*Market.*|.*Razer.*|.*peacock.*|.*zilla.*|.*DDG.*|.*Bogle.*|.*tpu.*|.*Artifakt.*|.*LG.*|.*GeForce.*|.*Sky.*|.*F1.*|.*Indy.*|.*Guardian.*|.*nyt.*|.*Times.*|.*Beaufort.*|.*MB.*|.*SF.*|.*Inter.*|.*Adelle.*|.*Barlow.*|.*Roboto.*|.*Avenir.*|.*Raleway.*|.*Proxima.*|.*Gotham.*|.*Futura.*|.*Plex.*|.*Clear.*|.*Karla.*|.*Work.*|.*Segoe.*|.*Selawik.*|.*WeblySleek.*|.*Frutiger.*|.*Commissioner.*|.*Oxygen.*|.*Myriad.*|.*Lucida.*|.*Lato.*|.*Nunito.*|.*Whitney.*|.*Motiva.*|.*Montserrat.*|.*PT.*|.*Fira.*|.*Ubuntu.*|.*Source.*|.*Noto.*|.*Open.*|.*Droid Sans.*|.*Museo.*|.*DIN.*|.*Keiner.*|.*Coffee.*|.*Oswald.*|.*Rubik.*|.*Industry.*|.*Rajdhani.*|.*Saira.*|.*Klavika.*|.*Petch.*|.*Univers.*|.*Franklin.*|.*Tahoma.*|.*Verdana.*|.*Impact.*|.*Impacted.*|.*Poppins.*|.*Roobert.*|.*Circular.*|.*Manrope.*|.*Benton.*|.*Mark.*|.*Helvetica.*|.*Archivo.*|.*Sora.*|.*Interstate.*|.*Helmet.*|.*Arial.*|.*Arimo.*|.*Rodin.*|.*Hiragino.*|.*Yu.*|.*Gothic.*|.*Yantramanav.*|.*Komika.*|.*Bitter.*|.*Playfair.*|.*Lora.*|.*Linux.*|.*Shippori.*|.*artifakt.*|.*角/mi",runes="Material Icons Extended, Material Icons, Google Material Icons, Material Design Icons, rtings-icons, VideoJS",killVar=0;const killVarOrig=killVar;compReps=0,compRepsLimit=1;const compRepsOrig=compReps;function runesFunc(){var e,t,n,s,o,i=segConst.getPropertyValue("font-variant-ligatures");typeof i!="undefined"&&i!=null&&(addStyleString(`* { font-variant-ligatures: ${i} !important }`),n=segConst.getPropertyValue("font-variant-numeric"),typeof n!="undefined"&&n!=null&&addStyleString(`* { font-variant-numeric: ${n} !important }`),s=segConst.getPropertyValue("font-feature-settings"),typeof s!="undefined"&&s!=null&&addStyleString(`* { font-feature-settings: ${s} !important }`),o=segConst.getPropertyValue("font-kerning"),typeof o!="undefined"&&o!=null&&addStyleString(`* { font-kerning: ${o} !important }`)),`preCompute.includes("<i>") === true`?(e=document.getElementsByTagName("i")[0],typeof e!="undefined"&&e!=null&&(t=t+","+window.getComputedStyle(e).getPropertyValue("font-family"))):`preCompute.includes("<span>") === true`?(e=document.getElementsByTagName("span")[0],typeof e!="undefined"&&e!=null&&(t=t+","+window.getComputedStyle(e).getPropertyValue("font-family"))):`preCompute.includes("<button>") === true`&&(e=document.getElementsByTagName("button")[0],typeof e!="undefined"&&e!=null&&(t=t+","+window.getComputedStyle(e).getPropertyValue("font-family"))),addStyleString(`* { font-family: ${font}, ${t} !important }`),addStyleString(`i { font-family: ${t}, ${font} !important }`),addStyleString(`span { font-family: ${t}, ${font} !important }`),addStyleString(`button { font-family: ${t}, ${font} !important }`)}if(`preCompute.includes("<body>") === true`){for(compReps=compRepsOrig,killVar=killVarOrig;killVar!=1&&compReps!=compRepsLimit;)if(font=window.getComputedStyle(document.getElementsByTagName("body")[compReps]).getPropertyValue("font-family"),`typeof ${font} != "undefined" && ${font} != null && ${regex}.test(font)`){throw segConst=window.getComputedStyle(document.getElementsByTagName("body")[compReps]),runesFunc(),Error();killVar=1}else compReps++;throw Error()}if(`preCompute.includes("<h2>") === true`){for(compReps=compRepsOrig,killVar=killVarOrig;killVar!=1&&compReps!=compRepsLimit;)if(font=window.getComputedStyle(document.getElementsByTagName("h2")[compReps]).getPropertyValue("font-family"),`typeof ${font} != "undefined" && ${font} != null && ${regex}.test(font)`){throw segConst=window.getComputedStyle(document.getElementsByTagName("h2")[compReps]),runesFunc(),Error();killVar=1}else compReps++;throw Error()}if(`preCompute.includes("<h1>") === true`){for(compReps=compRepsOrig,killVar=killVarOrig;killVar!=1&&compReps!=compRepsLimit;){if(font=window.getComputedStyle(document.getElementsByTagName("h1")[compReps]).getPropertyValue("font-family"),`typeof ${font} != "undefined" && ${font} != null && ${regex}.test(font)`)throw segConst=window.getComputedStyle(document.getElementsByTagName("h1")[compReps]),runesFunc(),Error();compReps++}throw Error()}if(`preCompute.includes("<p>") === true`){for(compReps=compRepsOrig,killVar=killVarOrig;killVar!=1&&compReps!=compRepsLimit;){if(font=window.getComputedStyle(document.getElementsByTagName("p")[compReps]).getPropertyValue("font-family"),`typeof ${font} != "undefined" && ${font} != null && ${regex}.test(font)`)throw segConst=window.getComputedStyle(document.getElementsByTagName("p")[compReps]),runesFunc(),Error();compReps++}throw Error()}
