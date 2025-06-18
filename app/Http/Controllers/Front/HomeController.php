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
    public function search(Request $request) {
        $trace_code = $request->input('trace_code');
        if (!$trace_code) {
            return redirect()->route('home')->with('error', 'Trace code is required');
        }
        $product = Product::with('createdBy')->where('trace_code', $trace_code)->first();
        if (!$product) {
            return redirect()->route('home')->with('error', 'Product not found');
        }
        $secretParam = hash_hmac('sha256', $trace_code, config('app.trace_secret_key'));
        // Redirect to the trace page with the trace code and add parameter uid to the URL
        return redirect()->route('trace', ['trace_code' => $trace_code, 'secret' => $secretParam])->with('success', 'Product found');

    }
    public function trace($trace_code)
    {
        $product = Product::with('createdBy')->where('trace_code', $trace_code)->first();
        if (!$product) {
            abort(404, 'Product not found');
        }
        $isAuthenticated = false;
        $secretParam = hash_hmac('sha256', $trace_code, config('app.trace_secret_key'));
        // Check if the secret parameter matches
        if (request()->input('secret') === $secretParam) {
            $isAuthenticated = true;
        }
        return view('front.trace', compact('product', 'trace_code', 'isAuthenticated'));
    }
    public function downloadQR($trace_code)
    {
        $qrCodeImage = QrCode::format('png')->size(300)->generate(route('trace', $trace_code));

        $fileName = 'qrcode-' . $trace_code . '.png';
        $filePath = storage_path('app/public/' . $fileName);
        file_put_contents($filePath, $qrCodeImage);

        return response()->download($filePath)->deleteFileAfterSend(true);
    }
}
