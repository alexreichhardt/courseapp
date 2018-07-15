
function dataSlider() {
  $(document).ready(function() {
      var slider = $("#the_slider").slider({
          range: true,
          min: 200,
          max: 500,
          values: [250, 450],
          slide: function(event, ui) {
              $("#thing_data1").val(ui.values[0]);
              $("#thing_data2").val(ui.values[1]);
          }
      });
      $("#thing_data1").val(slider.slider("values")[0]);
      $("#thing_data2").val(slider.slider("values")[1]);
  });
}
