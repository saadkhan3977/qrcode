<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\UrlText;
use Auth;
use Validator;

class URLController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try
        {
            $doc = UrlText::where('user_id',Auth::user()->id)->get();
			return response()->json(['success'=>true,'message'=>'URL List','info'=>$doc]);
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
        try{
			$validator = Validator::make($request->all(),[
				'text' =>'required',
				'type' =>'required',
			]);
			if($validator->fails())
			{
				return $this->sendError($validator->errors()->first(),500);
	
			}
            $data = UrlText::create([
                'user_id' => Auth::user()->id,
                'type' => $request->type,
                'text' => $request->text,
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
    public function destroy($id)
    {
        //
    }
}
