/* 
 * Adapted from http://snippets.dzone.com/posts/show/3411
 */

var Dialog = {};
Dialog.Box = Class.create();
Dialog.Box.Confirm = function(title, text, funcs){
	var dialogDiv = new Element('div', {'class': 'dialog-box confirm'}).update(text + "<br /><br />");
	$(document.body).insert(dialogDiv);
	var dialog = new Dialog.Box(dialogDiv, {title: title});

	var buttonOK = new Element('button').update(Dialog.Messages['ok']);
	buttonOK.on('click', function(e) { Event.stop(e); funcs['ok'](); dialog.hide(); });

	var buttonCancel = new Element('button').update(Dialog.Messages['cancel']);
	if (funcs['cancel']) {
		buttonCancel.on('click', function(e) { Event.stop(e); funcs['cancel'](); dialog.hide(); });
	} else {
		buttonCancel.on('click', function(e) { Event.stop(e); dialog.hide(); });
	}
	dialogDiv.insert(new Element('center')
		.insert(buttonOK, {position: 'after'})
		.insert(buttonCancel, {position: 'after'}));
	
	dialog.show();
};
Object.extend(Dialog.Box.prototype, {
  initialize: function(id, options) {
    this.createOverlay();
    var self = this;
    var options = options || {};

    this.dialog_box = $(id);
    this.dialog_box.show = this.show.bind(this);
    this.dialog_box.persistent_show = this.persistent_show.bind(this);
    this.dialog_box.hide = this.hide.bind(this);

    this.parent_element = this.dialog_box.parentNode;

    this.dialog_box.style.position = "absolute";
    

    var e_dims = Element.getDimensions(this.dialog_box);
    var b_dims = Element.getDimensions(this.overlay);

    if (this.dialog_box.select('div.dialog-box-title').length==0) {
    	var caption = new Element('div', {"class": "dialog-box-header"});
    	var close = new Element('a', {href: '#', "class": 'dialog-box-title-close'}).update('x');
    	Event.observe(close, 'click', function(event){ Event.stop(event); self.hide(event); });
    	caption.appendChild(new Element('div', {"class": "dialog-box-title"})).parentNode
		       .appendChild(close);
    	this.dialog_box.insertBefore(caption, this.dialog_box.childNodes[0]);
    	caption.setStyle({width: (e_dims.width ) + 'px'});
    }
    var title = options.title ? options.title : '';
    this.dialog_box.select('div.dialog-box-title').first().update(title);
    this.dialog_box.style.left = ((b_dims.width/2) - (e_dims.width/2)) + 'px';
    //this.dialog_box.style.top = this.getScrollTop() + ((this.winHeight() - (e_dims.width/2))/2) + 'px';
    this.dialog_box.style.zIndex = this.overlay.style.zIndex + 1;
  },

  createOverlay: function() {
    if ($('dialog_overlay')) {
      this.overlay = $('dialog_overlay');
    } else {
      this.overlay = document.createElement('div');
      this.overlay.id = 'dialog_overlay';
      Object.extend(this.overlay.style, {
//        position: 'absolute',
//        top: 0,
//        left: 0,
        zIndex: 90,
//        width: '100%',
//        backgroundColor: '#000',
        display: 'none'
      });
      document.body.insertBefore(this.overlay, document.body.childNodes[0]);
    }
  },

  moveDialogBox: function(where) {
    Element.remove(this.dialog_box);
    if (where == 'back')
      this.dialog_box = this.parent_element.appendChild(this.dialog_box);
    else
      this.dialog_box = this.overlay.parentNode.insertBefore(this.dialog_box, this.overlay);
  },

  show: function(optHeight/* optionally override the derived height, which often seems to be short. */) {
    //this.overlay.style.height = this.winHeight()+'px';
//	  if (navigator.appVersion.match(/\bMSIE\b/)) {
//			this._prepareIE("100%", "hidden");
//			//if (!navigator.appVersion.match(/\b7.0\b/)) window.scrollTo(0,0); // Disable scrolling on top for IE7
//		}
    this.moveDialogBox('out');

    //this.overlay.onclick = this.hide.bind(this);

    this.selectBoxes('hide');
    new Effect.Appear(this.overlay, {duration: 0.1, from: 0.0, to: 0.3});
    this.dialog_box.style.display = '';

    this.dialog_box.style.left = '0px';

    var e_dims = Element.getDimensions(this.dialog_box);

    this.dialog_box.style.left = (this.winWidth() - e_dims.width)/2 + 'px';

    var h = optHeight || (e_dims.height);
    var altTop  = (this.winHeight() - h)/2;
    if (altTop < 0) altTop = 100;
    this.dialog_box.style.top = this.getScrollTop() + altTop + 'px';
    //this.dialog_box.style.top = this.getScrollTop() + 80 + 'px';
  },

  getScrollTop: function() {
    return (window.pageYOffset)?window.pageYOffset:(document.documentElement && document.documentElement.scrollTop)?document.documentElement.scrollTop:document.body.scrollTop;
  },

  persistent_show: function() {
    this.overlay.style.height = this.winHeight()+'px';
    this.moveDialogBox('out');

    this.selectBoxes('hide');
    new Effect.Appear(this.overlay, {duration: 0.1, from: 0.0, to: 0.3});

    this.dialog_box.style.display = '';
    this.dialog_box.style.left = '0px';
    var e_dims = Element.getDimensions(this.dialog_box);
    this.dialog_box.style.left = (this.winWidth()/2 - e_dims.width/2) + 'px';
  },

  hide: function() {
    this.selectBoxes('show');
    new Effect.Fade(this.overlay, {duration: 0.1});
    this.dialog_box.style.display = 'none';
    this.moveDialogBox('back');
//    if (navigator.appVersion.match(/\bMSIE\b/)) {
//		this._prepareIE("100%", "");
//		//if (!navigator.appVersion.match(/\b7.0\b/)) window.scrollTo(0,0); // Disable scrolling on top for IE7
//	}
//    $A(this.dialog_box.getElementsByTagName('input')).each( function(e) {
//      if (e.type != 'submit' && e.type != 'button') e.value = '';
//    });
  },

  selectBoxes: function(what) {
    $A(document.getElementsByTagName('select')).each(function(select) {
      Element[what](select);
    });

    if (what == 'hide')
      $A(this.dialog_box.getElementsByTagName('select')).each(function(select){Element.show(select)})
  },

  winWidth: function() {
    if (typeof window.innerWidth != 'undefined')
       return window.innerWidth;
    if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0)
       return document.documentElement.clientWidth;
    return document.getElementsByTagName('body')[0].clientWidth
  },
  winHeight: function() {
    if (typeof window.innerHeight != 'undefined')
      return window.innerHeight
    if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientHeight != 'undefined' && document.documentElement.clientHeight != 0)
      return document.documentElement.clientHeight;
    return document.getElementsByTagName('body')[0].clientHeight;
  },
  //For IE browsers -- IE requires height to 100% and overflow hidden (taken from lightbox)
  _prepareIE: function(height, overflow){
		var body = document.getElementsByTagName('body')[0];
		body.style.height = height;
		body.style.overflow = overflow;

		var html = document.getElementsByTagName('html')[0];
		html.style.height = height;
		html.style.overflow = overflow; 
	}
});
