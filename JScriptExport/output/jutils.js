function addFeatures(aChart) {
	
  aChart.applyTheme("minimal");

  //turn off marks
  aChart.series.items[0].marks.visible = false;

  //animation
  animation=new Tee.SeriesAnimation();
  animation.duration=2000;
  animation.kind="each";
  fadeAnimation=new Tee.FadeAnimation();
  fadeAnimation.duration=500;
  fadeAnimation.fade.series=true;
  fadeAnimation.fade.marks=true;
  animation.mode = "linear";
  fadeAnimation.mode = "linear";
  animation.items.push(fadeAnimation);

  animation.animate(aChart);

  //tooltip
  tip=new Tee.ToolTip(aChart);
  tip.render="dom";
  tip.autoHide=true;
  tip.domStyle = "padding-left:8px; padding-right:8px; padding-top:0px; padding-bottom:4px; margin-left:5px; margin-top:0px; ";
  tip.domStyle = tip.domStyle + "background-color:#FCFCFC; border-radius:4px 4px; color:#FFF; ";
  tip.domStyle = tip.domStyle + "border-style:solid;border-color:#A3A3AF;border-width:1px; z-index:1000;";

  aChart.tools.add(tip);
  tip.onhide=function() { scaling=0; poindex=-1; }
  tip.ongettext=function( tool, text, series, index) { 
	var s = '<font face="verdana" color="black" size="1"><strong>'+ series.title+'</strong></font>';
		s = s + '<br/><font face="verdana" color="darkblue" size="1">Series point: <strong>'+ index.toFixed(0)+'</strong></font>';
		s =	s +'<br/><font face="verdana" color="red" size="1">Value: '+series.data.values[index].toFixed(2)+'</font>';  
	return s;
  }

}