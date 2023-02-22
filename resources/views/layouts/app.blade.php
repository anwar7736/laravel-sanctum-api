<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{asset('assets/css/bootstrap.min.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/css/toastr.min.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/css/jquery-ui.min.css')}}" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    @yield('css')
</head>
<body class="bg-secondary">
    
    @yield('content')

    <script src="{{asset('assets/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('assets/js/jquery.min.js')}}"></script>
    <script src="{{asset('assets/js/jquery-ui.min.js')}}"></script>
    <script src="{{asset('assets/js/axios.min.js')}}"></script>
    <script src="{{asset('assets/js/toastr.min.js')}}"></script>
    <script src="https://js.pusher.com/7.2/pusher.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.select2').select2();
        });
    Pusher.logToConsole = true;
    var pusher = new Pusher('174bb2e9b77af7af36d8', {
        cluster: 'ap2'
    });

    //Product Created
    var channel = pusher.subscribe('product-created');
    channel.bind('product-created', function(data) {
        $(document).find('h3').closest('div').after(
                `<center><div class="alert alert-success">
                    ${data.message}
                </div></center>`
            );

    $(document).find("tbody#prooduct_data").prepend(
        `<tr id="product_${data.product.id}">
                <td>1</td>
                <td class="${data.product.id}_name">${data.product.name}</td>
                <td class="${data.product.id}_price">${data.product.price}</td>
                <td class="${data.product.id}_discount">${data.product.discount ?? 0}</td>
                <td>
                    <a href="product/${data.product.id}/edit" class="btn btn-sm btn-success edit">Edit</a>
                </td>
                <td>
                    <a href="javascript:void(0)" class="btn btn-sm btn-danger">Delete</a>
                </td>
        </tr>`
        );
        });

        //Product Updated
        var channel = pusher.subscribe('product-updated');
        channel.bind('product-updated', function(data) {
            $(document).find('h3').closest('div').after(
                    `<center><div class="alert alert-success">
                        ${data.message}
                    </div></center>`
                );

                $(document).find(`td.${data.product.id}_name`).text(`${data.product.name}`);
                $(document).find(`td.${data.product.id}_price`).text(`${data.product.price}`);
                $(document).find(`td.${data.product.id}_discount`).text(`${data.product.discount ?? 0}`);
            
        });

        //Product Deleted
        var channel = pusher.subscribe('product-deleted');
        channel.bind('product-deleted', function(data) {
        $(document).find('h3').closest('div').after(
                `<center><div class="alert alert-danger">
                    ${data.message}
                </div></center>`
            );

        $(document).find(`tr#product_${data.product.id}`).remove();
        });
    </script>
    @stack('scripts')
</body>
</html>