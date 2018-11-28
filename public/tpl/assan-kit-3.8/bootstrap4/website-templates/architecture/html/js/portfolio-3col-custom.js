  //projects
            (function ($, window, document, undefined) {
                'use strict';

                // init cubeportfolio
                $('#js-grid-lightbox-gallery').cubeportfolio({
                    filters: '#js-filters-lightbox-gallery',
                    layoutMode: 'masonry',
                    mediaQueries: [{
                            width: 1500,
                            cols: 3
                        }, {
                            width: 1100,
                            cols: 3
                        }, {
                            width: 800,
                            cols: 3
                        }, {
                            width: 480,
                            cols: 2,
                            options: {
                                caption: ''
                            }
                        }],
                    defaultFilter: '*',
                    animationType: 'flipOutDelay',
                    gapHorizontal: 0,
                    gapVertical: 0,
                    gridAdjustment: 'responsive',
                    caption: 'zoom',
                    displayType: 'fadeIn',
                    displayTypeSpeed: 100,
                    // lightbox
                    lightboxDelegate: '.cbp-lightbox',
                    lightboxGallery: true,
                    lightboxTitleSrc: 'data-title',
                    lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>'
                });
            })(jQuery, window, document);