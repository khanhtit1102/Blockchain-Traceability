<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LogAdminActivity
{
    public function handle(Request $request, Closure $next)
    {
        $response = $next($request); // Đợi xử lý xong request

        $user = Auth::user();
        $userName = $user->name ?? 'guest';
        $method = $request->method();

        $actionMap = [
            'POST' => 'Thêm',
            'PUT' => 'Sửa',
            'PATCH' => 'Sửa',
            'DELETE' => 'Xóa',
        ];

        if (isset($actionMap[$method])) {
            activity($userName)
                ->causedBy($user)
                ->withProperties([
                    'url' => $request->fullUrl(),
                    'route' => $request->route() ? $request->route()->getName() : null,
                    'data' => $request->except(['_token', '_method']),
                ])
                ->log($actionMap[$method] . ' bản ghi');
        }

        return $response;
    }
}
