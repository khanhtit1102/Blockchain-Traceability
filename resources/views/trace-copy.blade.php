<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>
    @if (isset($trace_code))
        <p>Trace Code: {{ $trace_code }}</p>
    @else
        <p>No trace code provided in the URL.</p>
    @endif
    <div class="uk-container uk-padding">
        <div class="uk-timeline" id="uk-timeline">

        </div>
    </div>
    <script type="text/javascript" src="{{ voyager_asset('js/app.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/ethers@6.6.2/dist/ethers.umd.min.js"></script>
    <script type="text/javascript" src="{{ asset('resources/js/blockchain.js') }}?time={{ time() }}"></script>
    <script>
        // Get product trace code from the URL
        const traceCode = '{{ $trace_code }}';
        // Call the function if traceCode exists
        if (traceCode) {
            loadHistory(traceCode);
        }
    </script>
</body>

</html>
