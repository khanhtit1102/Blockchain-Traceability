<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductHistory;
use Illuminate\Http\Request;

class ProductHistoryController extends Controller
{
    public function index(Request $request, $trace_code)
    {
        // Validate the trace_code
        if (empty($trace_code)) {
            return response()->json(['error' => 'Trace code is required'], 400);
        }
        // Fetch product history based on trace_code
        $productHistories = ProductHistory::where('trace_code', $trace_code)
            ->with(['stage'])
            ->orderBy('created_at', 'asc')
            ->get();

        $tempImages = [];
        $tempTXHash = [];
        foreach ($productHistories as $productHistory) {
            if ($productHistory->images) {
                $tempImages[] = json_decode($productHistory->images, true);
                $tempTXHash[] = $productHistory->tx_hash;
            }
        }
        return response()->json([
            'trace_code' => $trace_code,
            'images' => $tempImages,
            'tx_hash' => $tempTXHash,
        ]);
    }
}
