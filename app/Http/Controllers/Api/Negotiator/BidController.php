<?php

namespace App\Http\Controllers\Api\Negotiator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bid;
use App\Models\BidHelp;
use App\Models\User;
use App\Models\Quote;
use Auth;

class BidController extends Controller
{
    
    public function quote_recommend_list()
    {
        try{

            $user = User::find(Auth::user()->id);
            // return $user->expertise;
            $matchedQuotes = Quote::with('images','user_info')->where(function ($query) use ($user) {
                foreach(json_decode($user->expertise) as $expertise) {
                    // print_r($expertise);die;
                    $query->orWhere('service_preference', 'like', "%$expertise%");
                    $query->Where('status','pending');
                }
            })->paginate(10);
            
			return response()->json(['success'=>true,'message'=>'Recommended Quotes','quote_info'=>$matchedQuotes]);

        }
        catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 

    }
    
    public function quote_complete_list()
    {
        try{

            $user = User::find(Auth::user()->id);
            // return $user->expertise;
            $matchedQuotes = Quote::with('review','review.user_info','images','user_info')->where(function ($query) use ($user) {
                foreach(json_decode($user->expertise) as $expertise) {
                    $query->Where('status','completed');
                }
            })->paginate(10);
            
			return response()->json(['success'=>true,'message'=>'Complete Quotes','quote_info'=>$matchedQuotes]);

        }
        catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 

    }
    public function search(Request $request,$type)
    {
        //return Auth::user();
        try{
            $search = $request->input('search');

            $user = User::find(Auth::user()->id);
            
            if($search)
            {
                if($type == "Recommended")
                {
                    $matchedQuotes = Quote::with('user_info')->where('negotiator_id', $user->id)->where(function ($query) use ($user) {
                        if($user->expertise){

                            foreach(json_decode($user->expertise) as $expertise) {
                                $query->where('title', 'like', "%".request()->input('search').'%');
                                $query->orWhere('service_preference', 'like', "%$expertise%");
                            }
                        }
                    })->where('status','pending')->paginate(10);
                }
                if($type == "Working On")
                {
                    Bid::with('quote')->where('user_id',$user->id)->get();
                    $matchedQuotes = Quote::with('user_info')->where('negotiator_id', $user->id)->where(function ($query) use ($user) {
                        if($user->expertise){
                        foreach(json_decode($user->expertise) as $expertise) {
                            $query->where('title', 'like', "%".request()->input('search').'%');
                            // $query->orWhere('service_preference', 'like', "%$expertise%");
                        }
                        }
                    })->where('status','onGoing')->paginate(10);

                }
                
                if($type == "Seeking Help")
                {
                    $matchedQuotes = BidHelp::with('images','user_info')->where('bid_name', 'like', "%".request()->input('search').'%')->paginate(10);
                            // $query->orWhere('service_preference', 'like', "%$expertise%");
                }
            }


            // $quote = Quote::where('service_preference', 'like', '%' . $search . '%')
            // // ->orWhere('state', 'like', '%' . $search . '%')
            // // ->orWhere('city', 'like', '%' . $search . '%')
            // // ->orWhere('quoted_price', 'like', '%' . $search . '%')
            // // ->orWhere('asking_price', 'like', '%' . $search . '%')
            // // ->orWhere('offering_percentage', 'like', '%' . $search . '%')
            // // ->orWhere('service_preference', 'like', '%' . $search . '%')
            // // ->orWhere('notes', 'like', '%' . $search . '%')
            // ->Where('status', $request->status)
            // ->get();


            // $user = User::find(Auth::user()->id);
            // $matchedQuotes = Quote::with('user_info')->where('service_preference', 'like', "%".$search.'%')->Where('status',$request->status)->paginate(10);

			return response()->json(['success'=>true,'message'=>'Quote List Successfully','quote_info'=>$matchedQuotes]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }
    public function quote_working_list()
    {
        try{ 

            $user = User::find(Auth::user()->id);
            $matchedQuotes = Bid::with('quote_info','quote_info.user_info' ,'quote_info.images')->where(['user_id'=>Auth::user()->id , 'status'=>'accept'])->paginate(10);
            $matchedhireQuotes = Quote::with('negotiator_info','images')->where(['negotiator_id'=>Auth::user()->id , 'status'=>'accepted'])->paginate(10);
			return response()->json(['success'=>true,'message'=>'Working Quotes','quote_info'=>$matchedQuotes,'hiring_info'=>$matchedhireQuotes]);

        }
        catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 

    }

    public function hiring_list()
    {
        // return Auth::user()->id;
        try
        {
            $user = Quote::with('images','negotiator_info')->where('status','pending')->where('type','specific')->where('negotiator_id',Auth::user()->id)->paginate(10);

			return response()->json(['success'=>true,'message'=>'Hiring List','hiring_info'=>$user]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }
    
    public function hiring_update(Request $request,$id)
    {
        try{ 

            $quote = Quote::find($id);
            $quote->status = $request->status;
            $quote->save();

			return response()->json(['success'=>true,'message'=>'Hiring Updated Successfully']);

        }
        catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 

    }
    
    public function quote_detail($id)
    {
        try{
            $matchedQuotes = Quote::with('images','review','review.user_info','user_info','bids','bids.user_info')->find($id);
            
			return response()->json(['success'=>true,'message'=>'Quote Detail','quote_info'=>$matchedQuotes]);

        }
        catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 

    }

    

    
    public function bid_help_list()
    {
        try
        {
            $user = BidHelp::with('images','user_info','negotiator_info')->paginate(10);

			return response()->json(['success'=>true,'message'=>'Bid Help List','bid_help_info'=>$user]);
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
   

    public function bid_help_update(Request $request,$id)
    {
        try{
			
            $bid = BidHelp::find($id);
            $bid->update([
                'negotiator_id' => Auth::user()->id,
                'status' => $request->status
            ]);

			return response()->json(['success'=>true,'message'=>'Updated Successfully','bid_info'=>$bid]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
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
			
            $data = Bid::create([
                'user_id' => Auth::user()->id,
                'quote_id' => $request->quote_id,
                'email' => $request->email,
                'coverletter' => $request->coverletter,
                'expertise' => $request->expertise,
                'fullname' => $request->fullname,
                'phone' => $request->phone
            ]);

           $user = Bid::with('quote_info')->where('user_id',Auth::user()->id)->get();

			return response()->json(['success'=>true,'message'=>'Bid Created Successfully','quote_info'=>$user]);
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
