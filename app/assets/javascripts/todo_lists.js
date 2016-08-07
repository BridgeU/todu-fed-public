$(function() {
  $(".todo-items").on("click", ".js-mark-complete", function(event) {
    event.preventDefault();

    var $link = $(this);
    var $todoItem = $link.closest(".todo-item");

    // AJAX call to update mark the item as complete
    $.ajax(this.href, {
      method: $link.data("method"),
      dataType: "json"
    }).success(function () {

      // If successful, get and display the item's new HTML
      $.get($todoItem.data("url")).success(function(html) {
        $todoItem.append(html);
      }.bind(this))

    }).error(function () {

      // If it fails, tell the user (ugly)
      alert("Item couldn't be marked complete");

    })

    return false
  })
})
