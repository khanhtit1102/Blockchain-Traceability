<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;

class CustomVoyagerController extends VoyagerBaseController
{
    public function store(Request $request)
{
    $result = parent::store($request);

    $slug = $this->getSlug($request);
    $data = $request->except(['_token', '_method', 'voyager_media_removals']);
    $userName = auth()->user()->name ?? 'guest';

    activity($userName) // log_name = tên người thao tác
        ->causedBy(auth()->user())
        ->withProperties([
            'table' => $slug,
            'data_new' => $data
        ])
        ->log('Thêm bản ghi mới');

    return $result;
}
   public function update(Request $request, $id)
{
    $slug = $this->getSlug($request);
    $oldData = DB::table($slug)->find($id);
    $newData = $request->except(['_token', '_method', 'voyager_media_removals']);
    $userName = auth()->user()->name ?? 'guest';

    $result = parent::update($request, $id);

    activity($userName)
        ->causedBy(auth()->user())
        ->withProperties([
            'table' => $slug,
            'id' => $id,
            'data_old' => $oldData,
            'data_new' => $newData
        ])
        ->log('Cập nhật bản ghi');

    return $result;
}

   public function destroy(Request $request, $id)
{
    $slug = $this->getSlug($request);
    $oldData = DB::table($slug)->find($id);
    $userName = auth()->user()->name ?? 'guest';

    activity($userName)
        ->causedBy(auth()->user())
        ->withProperties([
            'table' => $slug,
            'id' => $id,
            'data_old' => $oldData
        ])
        ->log('Xóa bản ghi');

    return parent::destroy($request, $id);
}
}

