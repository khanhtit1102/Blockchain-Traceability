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
            // Bỏ qua log cho các route đăng nhập/đăng xuất và quy trình xác thực
            $routeName = $request->route() ? $request->route()->getName() : null;
            $ignoredRouteNames = [
                'login',
                'logout',
                'password.email',
                'password.update',
                'password.confirm',
                'password.request',
                'password.reset',
                'two-factor.login',
                'two-factor.challenge',
            ];
            $ignoredPaths = [
                'login',
                'logout',
                'password/*',
                'two-factor*',
                'admin/login*'
            ];

            if (($routeName && in_array($routeName, $ignoredRouteNames, true)) || $request->is($ignoredPaths)) {
                return $response; // Không ghi log cho đăng nhập/đăng xuất
            }

            // Loại bỏ các trường nhạy cảm khỏi dữ liệu log (phòng trường hợp có form chứa mật khẩu)
            $data = $request->except(['_token', '_method']);
            unset(
                $data['password'],
                $data['password_confirmation'],
                $data['current_password'],
                $data['new_password'],
                $data['new_password_confirmation']
            );

            activity($userName)
                ->causedBy($user)
                ->withProperties([
                    'url' => $request->fullUrl(),
                    'route' => $request->route() ? $request->route()->getName() : null,
                    'data' => $data,
                ])
                ->log($actionMap[$method] . ' bản ghi');
        }

        return $response;
    }
}
