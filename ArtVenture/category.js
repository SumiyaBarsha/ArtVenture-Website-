$(document).ready(function () {
    $('#searchButton').click(function () {
        var searchQuery = $('#searchInput').val();
        $.ajax({
            type: 'POST',
            url: 'category.aspx/Search',
            data: JSON.stringify({ searchQuery: searchQuery }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (response) {
                // Handle the server response here
                var searchResults = JSON.parse(response.d);
                var tableBody = $('#searchResultsRepeater tbody');
                tableBody.empty();

                $.each(searchResults, function (index, result) {
                    var row = '<tr>' +
                        '<td>' + result.Img + '</td>' +
                        '<td>' + result.Img_name + '</td>' +
                        '<td>' + result.Img_price + '</td>' +
                        '</tr>';

                    tableBody.append(row);
                });
            },
            error: function (xhr, textStatus, error) {
                // Handle any error that occurs during the AJAX request
                console.log(error);
            }
        });
    });
});