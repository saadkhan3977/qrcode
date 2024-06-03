<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Document;
use App\Models\UrlText;
use App\Models\PDF;
use Auth;
use Validator;
use Illuminate\Support\Str;

class DocumentController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try
        {
            // return $request->type;
            // $doc = Document::where('type',$request->type)->where('user_id',Auth::user()->id)->get();
            
            
            $data['text'] = UrlText::where('type','text')->where('user_id',Auth::user()->id)->get();
            $data['url'] = UrlText::where('type','url')->where('user_id',Auth::user()->id)->get();
            $data['image'] = PDF::where('type','image')->where('user_id',Auth::user()->id)->get();
            $data['pdf'] = PDF::where('type','pdf')->where('user_id',Auth::user()->id)->get();
			
			return response()->json(['success'=>true,'message'=>'Docs List','info'=>$data]);
        }
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
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
        // return $request->qr_name;
        try{
			$validator = Validator::make($request->all(),[
				'type' =>'required',
				// 'last_name' =>'string',
				//'email' => 'email|unique:users,email,'.$olduser->id,
				// 'phone' =>'numeric',
				// 'image' => 'required|image',
			]);
			if($validator->fails())
			{
				return $this->sendError($validator->errors()->first(),500);
	
			}
                $imageData = $request->input('image');
                // Decode the base64 image data
                $imageData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $imageData));

                // Generate a unique filename
                $filename = Str::random(10) . '.png'; // You can choose any extension you want

                // Specify the directory where you want to save the image
                $directory = public_path('uploads/document');

                // Make the directory if it doesn't exist
                if (!file_exists($directory)) {
                    mkdir($directory, 0777, true);
                }

                // Save the image to the specified directory
                file_put_contents($directory . '/' . $filename, $imageData);

                // Optionally, you can save the image path to your database or return it as a response
                $imagePath = '/uploads/document/' . $filename;

                $data = Document::create([
                    'user_id' => Auth::user()->id,
                    'image' => $imagePath,
                    'type' => $request->type,
                    'qr_name' => $request->qr_name,
                ]);

			return response()->json(['success'=>true,'message'=>'Uploaded Successfully']);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
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
    public function destroy(Request $request)
    {
        try
        {
            if($request->type == 'pdf')
            {
                foreach($request->id as $id)
                {
                    $pdf = PDF::find($id);
                    \File::delete('uploads/pdf/',$pdf->path);
                    $pdf->delete();
                }
            }
            else if($request->type == 'image')
            {
                foreach($request->id as $id)
                {
                    $pdf = PDF::find($id);
                    \File::delete('uploads/document/',$pdf->path);
                    $pdf->delete();
                }
            }
            
            else
            {
                foreach($request->id as $id)
                {
                    $pdf = UrlText::find($id);
                    $pdf->delete();
                }
            }
            
        	return response()->json(['success'=>true,'message'=>'delete Successfully']);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }
}
