<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController as BaseController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PDF;
use Auth;
use Validator;

class PDFController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
			$validator = Validator::make($request->all(),[
				'name' =>'required',
				'file' =>'required',
			]);
			if($validator->fails())
			{
				return $this->sendError($validator->errors()->first());
	
			}
                $file = $request->file('file');
                $fileName = md5($file->getClientOriginalName() . time()) . '.' . $file->getClientOriginalExtension();

                $file->move('uploads/pdf/', $fileName);  
                $filePath = asset('uploads/pdf/', $fileName);  
            
                // Save file path to database along with other information
                $pdf = new Pdf();
                $pdf->user_id = Auth::user()->id;
                $pdf->filename = $request->name;
                $pdf->path = $filePath . '/' . $fileName;
                $pdf->type = $request->type;
                $pdf->qr_name = $request->qr_name;
                $pdf->save();

			return response()->json(['success'=>true,'message'=>'Uploaded Successfully','pdf_info'=>$pdf]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }

    public function downloadPDF($id)
    {
        $pdf = Pdf::findOrFail($id);
        $filePath = storage_path('app/' . $pdf->path);

        return response()->download($filePath, $pdf->name);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
