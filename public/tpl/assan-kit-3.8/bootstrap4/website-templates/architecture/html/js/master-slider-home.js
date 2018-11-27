var masterslider = new MasterSlider();

			// slider controls
			masterslider.control('arrows'     ,{ autohide:true, overVideo:true  });
			// slider setup
			masterslider.setup("masterslider", {
				width           :1140,
				height          : 690,
				minHeight       : 0,
				space           : 0,
				start           : 1,
				grabCursor      : true,
				swipe           : true,
				mouse           : true,
				keyboard        : true,
				layout          : "boxed",
				wheel           : false,
				autoplay        : true,
				instantStartLayers:true,
				loop            : true,
				shuffle         : false,
				preload         : 0,
				heightLimit     : true,
				autoHeight      : false,
				smoothHeight    : true,
				endPause        : false,
				overPause       : false,
				fillMode        : "fill",
				centerControls  : false,
				startOnAppear   : false,
				layersMode      : "center",
				autofillTarget  : "",
				hideLayers      : false,
				fullscreenMargin: 0,
				speed           : 10,
				dir             : "h",
				parallaxMode    : 'mouse:y-only',
				view            : "fade"
			});