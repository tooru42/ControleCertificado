$(document).ready(function() {
    //conflict between datatables and turbolinks
    //Do not initial the datetables again when return back from turbolink cache.
    document.addEventListener("turbolinks:load", function() {
        "use strict";
        if ($("tabelas").length == 0) {
          $('#tabelas').DataTable();
        }
      })
});
