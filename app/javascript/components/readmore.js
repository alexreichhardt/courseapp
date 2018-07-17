function enableReadMore() {
  if (document.querySelector(".truncate")) {
      $.fn.truncate = function(options) {
      $(this).append('<span class="truncate_lh" style="display:none;">&nbsp;</span>')

      var defaults = {
        maxlines: 10,
        moreText: 'Read full description',
        lessText: 'Hide',
        ellipsis: '...'
      };

      if ($('.truncate_lh')) {
        $.extend(options, {
          lineheight: ($('.truncate_lh').css('height').replace('px', ''))
        });
        $.extend(options, {
          maxheight: (options.maxlines * options.lineheight)
        });
      }

      options = $.extend(defaults, options);

      return this.each(function() {
        var text = $(this);

        if (text.height() > options.maxheight) {

          text.css({
            'overflow': 'hidden',
            'height': options.maxheight + 'px'
          });

          var link = $('<a href="#" class="showHide emphasized-text">' + options.moreText + '</a>');
          var wrapDiv = $('<div class="truncate_wrap" />');

          text.wrap(wrapDiv);
          text.after(link);

          link.click(function() {
            if (link.text() == options.moreText) {
              link.text(options.lessText);
              text.css('height', 'auto');
            } else {
              link.text(options.moreText);
              text.css('height', options.maxheight + 'px');
            }
            return false;
          });
        }
      });
    };

    $().ready(function() {
      if ($('.truncate')) {
        $('.truncate').truncate( {
          maxlines: 5
        });
      }
    });
  }
}

export { enableReadMore }
