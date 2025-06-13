<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class HomeController extends Controller
{
    public function index()
    {
        $products = Product::with('createdBy')->latest()->paginate(10);
        return view('front.homepage', compact('products'));
    }
    public function trace($trace_code)
    {
        $product = Product::with('createdBy')->where('trace_code', $trace_code)->first();
        if (!$product) {
            abort(404, 'Product not found');
        }
        return view('front.trace', compact('product', 'trace_code'));
    }
    public function dowwnloadQR($trace_code)
    {
        $qrCodeImage = QrCode::format('png')->size(300)->generate(route('trace', $trace_code));

        $fileName = 'qrcode-' . $trace_code . '.png';
        $filePath = storage_path('app/public/' . $fileName);
        file_put_contents($filePath, $qrCodeImage);

        return response()->download($filePath)->deleteFileAfterSend(true);
    }
}
