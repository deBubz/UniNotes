//tealium universal tag - utag.111 ut4.0.202103020449, Copyright 2021 Tealium.com Inc. All Rights Reserved.
try{(function(id,loader){var u={"id":id};utag.o[loader].sender[id]=u;if(utag.ut===undefined){utag.ut={};}
var match=/ut\d\.(\d*)\..*/.exec(utag.cfg.v);if(utag.ut.loader===undefined||!match||parseInt(match[1])<35){u.loader=function(o){var b,c,l,a=document;if(o.type==="iframe"){b=a.createElement("iframe");o.attrs=o.attrs||{"height":"1","width":"1","style":"display:none"};for(l in utag.loader.GV(o.attrs)){b.setAttribute(l,o.attrs[l]);}b.setAttribute("src",o.src);}else if(o.type=="img"){utag.DB("Attach img: "+o.src);b=new Image();b.src=o.src;return;}else{b=a.createElement("script");b.language="javascript";b.type="text/javascript";b.async=1;b.charset="utf-8";for(l in utag.loader.GV(o.attrs)){b[l]=o.attrs[l];}b.src=o.src;}if(o.id){b.id=o.id};if(typeof o.cb=="function"){if(b.addEventListener){b.addEventListener("load",function(){o.cb()},false);}else{b.onreadystatechange=function(){if(this.readyState=='complete'||this.readyState=='loaded'){this.onreadystatechange=null;o.cb()}};}}l=o.loc||"head";c=a.getElementsByTagName(l)[0];if(c){utag.DB("Attach to "+l+": "+o.src);if(l=="script"){c.parentNode.insertBefore(b,c);}else{c.appendChild(b)}}}}else{u.loader=utag.ut.loader;}
u.ev={"view":1,"link":1};u.rp=function(a,b){if(typeof a!="undefined"&&a.indexOf(u.t)>0){a=a.replace(/@@([^@]+)@@/g,function(m,d){if(b[d]){return encodeURIComponent(b[d]);}else{return'';}});}
return a;};u.map={};u.extend=[function(a,b){try{if(1){var rtb_jobIds=b['firstThreeJobIds'];var rtb_jobIdsString=typeof(rtb_jobIds)!='undefined'?rtb_jobIds.join():'';var eventName=b['eventName'].toString();switch(eventName){case'home-page-viewed':b['rtb_pixel']='_home'
break;case'search-results-viewed':b['rtb_pixel']='_listing_'+rtb_jobIdsString;if(typeof b['searchClassificationId']!="undefined"){b['rtb_pixel2']='_custom_classification_'+b['searchClassificationId']+'&id=pr_GNnNkhlrBDtRuADp2B0z_custom_site_seek';}
break;case'job-details-viewed':b['rtb_pixel']='_offer_'+b['jobId'];b['rtb_pixel2']='_custom_classification_'+b['jobClassificationId']+'&id=pr_GNnNkhlrBDtRuADp2B0z_custom_sub-classification_'+b['jobSubClassificationId']+'&id=pr_GNnNkhlrBDtRuADp2B0z_custom_site_seek';break;case'apply-button-clicked':b['rtb_pixel']='_orderstatus2_1_'+b['advertiserId']+'-SEEK-'+b['jobId']+'_'+b['jobId'];break;case'application-complete':b['rtb_pixel2']='_orderstatus2_1_SEEK-'+b['jobClassificationId']+'-'+b['jobSubClassificationId']+'-'+b['jobId']+'_'+b['jobId']+'&id=pr_GNnNkhlrBDtRuADp2B0z_custom_site_seek&cd=default';break;default:b['rtb_pixel']='&ncm=1';}}}catch(e){utag.DB(e)}}];u.send=function(a,b){if(u.ev[a]||u.ev.all!==undefined){utag.DB("send:111");utag.DB(b);var c;u.t="@@";u.p=["https://asia.creativecdn.com/tags?id=pr_GNnNkhlrBDtRuADp2B0z@@rtb_pixel@@&id=pr_GNnNkhlrBDtRuADp2B0z_custom_site_seek","https://asia.creativecdn.com/tags?id=pr_GNnNkhlrBDtRuADp2B0z@@rtb_pixel2@@","","","","","",""];u.delim="";u.cachebust="disabled";u.cachevar=""||"_rnd";for(c=0;c<u.extend.length;c++){try{d=u.extend[c](a,b);if(d==false)return}catch(e){}};for(c=0;c<u.p.length;c++){if(u.p[c]!=""){var x=u.rp(u.p[c],b);if(x!=""){if(u.cachebust=="enabled"&&x.indexOf(u.cachevar)<0){if(x.indexOf("?")<0){u.delim="?";}else{u.delim="&";}
x+=u.delim+u.cachevar+"="+Math.random();}
u.loader({"type":"iframe","src":x,"loc":"body","id":"111-"+c});}}}}};utag.o[loader].loader.LOAD(id);}("111","seek.houston"));}catch(error){utag.DB(error);}