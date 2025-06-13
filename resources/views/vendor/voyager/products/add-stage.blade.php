@extends('voyager::master')

@section('page_title', __('voyager::generic.view') . ' ' . $dataType->getTranslatedAttribute('display_name_singular'))

@section('css')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.4.2/dist/css/uikit.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.4/css/lightbox.min.css" />
@endsection

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }}
        {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;

        @can('edit', $dataTypeContent)
            <a href="{{ route('voyager.' . $dataType->slug . '.edit', $dataTypeContent->getKey()) }}" class="btn btn-info">
                <i class="glyphicon glyphicon-pencil"></i> <span
                    class="hidden-xs hidden-sm">{{ __('voyager::generic.edit') }}</span>
            </a>
        @endcan
        @can('delete', $dataTypeContent)
            @if ($isSoftDeleted)
                <a href="{{ route('voyager.' . $dataType->slug . '.restore', $dataTypeContent->getKey()) }}"
                    title="{{ __('voyager::generic.restore') }}" class="btn btn-default restore"
                    data-id="{{ $dataTypeContent->getKey() }}" id="restore-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.restore') }}</span>
                </a>
            @else
                <a href="javascript:;" title="{{ __('voyager::generic.delete') }}" class="btn btn-danger delete"
                    data-id="{{ $dataTypeContent->getKey() }}" id="delete-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.delete') }}</span>
                </a>
            @endif
        @endcan
        @can('browse', $dataTypeContent)
            <a href="{{ route('voyager.' . $dataType->slug . '.index') }}" class="btn btn-warning">
                <i class="glyphicon glyphicon-list"></i> <span
                    class="hidden-xs hidden-sm">{{ __('voyager::generic.return_to_list') }}</span>
            </a>
        @endcan
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-6">

                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <div class="row">
                        <div class="col-md-6" style="display: flex; justify-content: center">
                            <div class="img-thumbnail" id="qrcode">
                                {!! QrCode::generate(route('trace', $trace_code)) !!}
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="btn-group" role="group" aria-label="Product Actions">
                                <button class="btn btn-primary" onclick="downloadSVG()">
                                    <i class="glyphicon glyphicon-download"></i>
                                    Tải xuống QR
                                </button>
                                <br>
                                <a href="{{ route('products.add-stages', $dataTypeContent->getKey()) }}"
                                    class="btn btn-success">
                                    <i class="glyphicon glyphicon-book"></i> Ghi nhật ký sản phẩm
                                </a>
                                <br>
                                <a href="{{ route('trace', $trace_code) }}" target="_new" class="btn btn-info">
                                    <i class="glyphicon glyphicon-search"></i> Truy xuất nguồn gốc
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- form start -->
                    @foreach ($dataType->readRows as $row)
                        @php
                            if ($dataTypeContent->{$row->field . '_read'}) {
                                $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field . '_read'};
                            }
                        @endphp
                        <div class="panel-heading" style="border-bottom:0;">
                            <h3 class="panel-title">{{ $row->getTranslatedAttribute('display_name') }}</h3>
                        </div>

                        <div class="panel-body" style="padding-top:0;">
                            @if (isset($row->details->view_read))
                                @include($row->details->view_read, [
                                    'row' => $row,
                                    'dataType' => $dataType,
                                    'dataTypeContent' => $dataTypeContent,
                                    'content' => $dataTypeContent->{$row->field},
                                    'view' => 'read',
                                    'options' => $row->details,
                                ])
                            @elseif (isset($row->details->view))
                                @include($row->details->view, [
                                    'row' => $row,
                                    'dataType' => $dataType,
                                    'dataTypeContent' => $dataTypeContent,
                                    'content' => $dataTypeContent->{$row->field},
                                    'action' => 'read',
                                    'view' => 'read',
                                    'options' => $row->details,
                                ])
                            @elseif($row->type == 'image')
                                <img class="img-responsive"
                                    src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                            @elseif($row->type == 'multiple_images')
                                @if (json_decode($dataTypeContent->{$row->field}))
                                    @foreach (json_decode($dataTypeContent->{$row->field}) as $file)
                                        <img class="img-responsive"
                                            src="{{ filter_var($file, FILTER_VALIDATE_URL) ? $file : Voyager::image($file) }}">
                                    @endforeach
                                @else
                                    <img class="img-responsive"
                                        src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                @endif
                            @elseif($row->type == 'relationship')
                                @include('voyager::formfields.relationship', [
                                    'view' => 'read',
                                    'options' => $row->details,
                                ])
                            @elseif(
                                $row->type == 'select_dropdown' &&
                                    property_exists($row->details, 'options') &&
                                    !empty($row->details->options->{$dataTypeContent->{$row->field}}))
                                <?php echo $row->details->options->{$dataTypeContent->{$row->field}}; ?>
                            @elseif($row->type == 'select_multiple')
                                @if (property_exists($row->details, 'relationship'))
                                    @foreach (json_decode($dataTypeContent->{$row->field}) as $item)
                                        {{ $item->{$row->field} }}
                                    @endforeach
                                @elseif(property_exists($row->details, 'options'))
                                    @if (!empty(json_decode($dataTypeContent->{$row->field})))
                                        @foreach (json_decode($dataTypeContent->{$row->field}) as $item)
                                            @if (@$row->details->options->{$item})
                                                {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                            @endif
                                        @endforeach
                                    @else
                                        {{ __('voyager::generic.none') }}
                                    @endif
                                @endif
                            @elseif($row->type == 'date' || $row->type == 'timestamp')
                                @if (property_exists($row->details, 'format') && !is_null($dataTypeContent->{$row->field}))
                                    {{ \Carbon\Carbon::parse($dataTypeContent->{$row->field})->formatLocalized($row->details->format) }}
                                @else
                                    {{ $dataTypeContent->{$row->field} }}
                                @endif
                            @elseif($row->type == 'checkbox')
                                @if (property_exists($row->details, 'on') && property_exists($row->details, 'off'))
                                    @if ($dataTypeContent->{$row->field})
                                        <span class="label label-info">{{ $row->details->on }}</span>
                                    @else
                                        <span class="label label-primary">{{ $row->details->off }}</span>
                                    @endif
                                @else
                                    {{ $dataTypeContent->{$row->field} }}
                                @endif
                            @elseif($row->type == 'color')
                                <span class="badge badge-lg"
                                    style="background-color: {{ $dataTypeContent->{$row->field} }}">{{ $dataTypeContent->{$row->field} }}</span>
                            @elseif($row->type == 'coordinates')
                                @include('voyager::partials.coordinates')
                            @elseif($row->type == 'rich_text_box')
                                @include('voyager::multilingual.input-hidden-bread-read')
                                {!! $dataTypeContent->{$row->field} !!}
                            @elseif($row->type == 'file')
                                @if (json_decode($dataTypeContent->{$row->field}))
                                    @foreach (json_decode($dataTypeContent->{$row->field}) as $file)
                                        <a
                                            href="{{ Storage::disk(config('voyager.storage.disk'))->url($file->download_link) ?: '' }}">
                                            {{ $file->original_name ?: '' }}
                                        </a>
                                        <br />
                                    @endforeach
                                @elseif($dataTypeContent->{$row->field})
                                    <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($row->field) ?: '' }}">
                                        {{ __('voyager::generic.download') }}
                                    </a>
                                @endif
                            @else
                                @include('voyager::multilingual.input-hidden-bread-read')
                                <p>{{ $dataTypeContent->{$row->field} }}</p>
                            @endif
                        </div><!-- panel-body -->
                        @if (!$loop->last)
                            <hr style="margin:0;">
                        @endif
                    @endforeach

                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-info">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <i class="glyphicon glyphicon-search"></i>
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                        aria-expanded="true" aria-controls="collapseOne">
                                        Lịch sử sản phẩm
                                    </a>
                                    <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel"
                                aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <div class="uk-container uk-padding">
                                        <div class="uk-timeline" id="uk-timeline">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-warning">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                        href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        Ghi nhật ký
                                    </a>
                                    <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel"
                                aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <form action="" method="POST" autocomplete="off" enctype="multipart/form-data"
                                        id="addStageForm">
                                        @csrf
                                        <input type="hidden" name="trace_code" id="trace_code"
                                            value="{{ $trace_code }}">
                                        <div class="form-group">
                                            <label for="stageSelect">Chọn công đoạn:</label>
                                            <select class="form-control" id="stageSelect" name="stage_id">
                                                <option value="" selected disabled>-- Chọn công đoạn --</option>
                                                @foreach ($stages as $stage)
                                                    <option value="{{ $stage->id }}">{{ $stage->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="remove-attribute-name">
                                            @include('vendor.voyager.products.partials.congdoan')
                                        </div>
                                        <input type="hidden" name="stage_data" value="">
                                        <div class="form-group col-md-12 images-congdoan d-none">
                                            <label class="control-label" for="images-input">Hình ảnh</label>
                                            <br>
                                            <div class="clearfix"></div>
                                            <input type="file" name="images[]" multiple="multiple" accept="image/*"
                                                id="images-input">
                                        </div>
                                        <button type="button" class="btn btn-primary btnAddStage">Ghi nhật ký</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Single delete modal --}}
    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }}
                        {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('voyager.' . $dataType->slug . '.index') }}" id="delete_form" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                            value="{{ __('voyager::generic.delete_confirm') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right"
                        data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@stop

@section('javascript')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.4/js/lightbox.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.4.2/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.4.2/dist/js/uikit-icons.min.js"></script>
    @if ($isModelTranslatable)
        <script>
            $(document).ready(function() {
                $('.side-body').multilingual();
            });
        </script>
    @endif
    <script>
        var deleteFormAction;
        $('.delete').on('click', function(e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/) ?
                deleteFormAction.replace(/([0-9]+$)/, $(this).data('id')) :
                deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });
    </script>
    <script>
        $(document).ready(function() {
            $('#stageSelect').on('change', function() {
                var selectedStage = $(this).val();
                $('.ql-va-san-xuat, .che-bien, .luu-thong, .tieu-thu').addClass('d-none');
                $('#congdoan' + selectedStage).removeClass('d-none');
                $('.images-congdoan').removeClass('d-none');
            });

        });
    </script>
@stop
