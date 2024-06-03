<?php

namespace App\Http\Controllers\Api\Member;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Quote;
use App\Models\QuoteImage;
use App\Models\User;
use App\Models\Bid;
use Auth;
use DB;

class QuoteController extends Controller
{
    public function index()
    {
        try
        {
            $user = Quote::with('images','review','review.user_info','bids','bids.user_info')->where('user_id',Auth::user()->id)->orderBy('id','desc')->paginate(10);

			return response()->json(['success'=>true,'message'=>'Quote List','quote_info'=>$user]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }
    
    

    public function search(Request $request)
    {
        // return count($request->expertise);
        // return response()->json(['success'=>true,'message'=>'Negotiator Lists','negotiator_info'=>[]]);
        try{
        // print_r($request->all());die;
            $expertiseArray = $request->expertise;
            $levels = $request->level;
            //return $levels;
            if(count($levels) > 0)
            {
            // return 'asd';

               // if($levels != [null]){
                    // return $levels;
                    $usersQuery = User::with('negotiator_review','negotiator_review.user_info')->select('users.*', DB::raw('AVG(reviews.rating) as average_rating'))
                    ->join('reviews', 'users.id', '=', 'reviews.assign_user_id')
                    ->groupBy('users.id');


                    $usersQuery->having(function ($query) use ($levels) {
                        foreach ($levels as $level) {
                            if($level == 'bronze'){
                            $query->havingRaw('AVG(reviews.rating) >= 2.5 AND AVG(reviews.rating) <= 3.1');
                            }
                            if($level == 'silver'){
                            $query->orhavingRaw('AVG(reviews.rating) >= 3 AND AVG(reviews.rating) <= 3.5');
                            }
                            if($level == 'gold'){
                            $query->orhavingRaw('AVG(reviews.rating) >= 3.5 AND AVG(reviews.rating) <= 4');
                            }
                            if($level == 'platinum'){  
                            $query->orhavingRaw('AVG(reviews.rating) >= 4 AND AVG(reviews.rating) <= 5');
                            }
                            else{
                                $query->havingRaw('AVG(reviews.rating) >= 1 AND AVG(reviews.rating) <= 5');
                            }
                        }
                    });
                // }
                // else {
                //     $usersQuery = User::with('negotiator_review','negotiator_review.user_info');
                // }
            }
            else{

                $usersQuery = User::with('negotiator_review','negotiator_review.user_info');
            }
             //return count($request->expertise);
            // if(!empty($request->expertise))
            // {
             if($request->search)
            {
                // return $request->search;
                // $usersQuery->where('first_name',  $request->search );
                $usersQuery->where('first_name', 'like', '%' . $request->search . '%');
                // $usersQuery->orWhere('last_name', 'like', '%' . $request->search . '%');
            }
            else
            {

            if(count($request->expertise) > 0)
            {
                
                // return $request->expertise[0];
                // return 'saad test';
                foreach($expertiseArray as $expertise) {
                    // return $expertise;
                    $usersQuery->orWhere('expertise', 'like', '%' .  $expertise. '%');
                }
            }
        }

            
            $usersQuery->where('role', 'Qbid Negotiator');
                $users = $usersQuery->get()->map(function ($user) {
                    $user['average_rating'] = $user->averageRating();
                    return $user;
                });
            return response()->json(['success'=>true,'message'=>'Negotiator Lists','negotiator_info'=>$users]);

		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }
    
    public function search_type(Request $request , $status) 
    {
        try
        {
            // return $request->title;
            $quoteq = Quote::with('images')->where('user_id',Auth::user()->id);
            if($request->status)
			{
				$quoteq->where('status', $request->status);
            }
			if($request->title){

                $quoteq->where('title', 'like', '%' .   $request->title . '%');
            }
            $quote = $quoteq->get();
			return response()->json(['success'=>true,'message'=>'Quote Lists','quote_info'=>$quote]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }
    
    public function negotitator_list(Request $request) 
    {
        try
        {
            //return Auth::user();
            $quote = User::with('ratings','ratings.user_info')->where('role', 'Qbid Negotiator')->orderBy('id','desc')->get()->map(function ($user) {
                $user['average_rating'] = $user->averageRating();
                return $user;
            });
			return response()->json(['success'=>true,'message'=>'Negotitator Lists','negotitator_info'=>$quote]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }


    public function update_status(Request $request,$id)
    {
        try{
			
            $bid = Quote::find($id);
            $bid->update([
                'status' => $request->status
            ]);

			return response()->json(['success'=>true,'message'=>'Updated Successfully','quote_info'=>$bid]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }

    public function ongoing()
    {
        try
        {
            $user = Quote::with('images','bids','bids.user_info')->where('status','onGoing')->where('user_id',Auth::user()->id)->paginate(10);

			return response()->json(['success'=>true,'message'=>'Quote List','quote_info'=>$user]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }


    
    public function bid_list()
    {
        try
        {

            $user = User::with('quotes')->find(auth()->user()->id); // Assuming you have the authenticated user
            $userQuotes = $user->quotes; // Get the quotes added by the user
            $quoteBids = null;
            $bigs = [];
            foreach ($userQuotes as $quote) 
            {
                $bids[] = Bid::with('quote_info')->first();
                $quoteBids = $quote->bids; // Get bids on this quote
            }
           // return $bids;

            // $user = Bid::with('quote_infos')->get();

			return response()->json(['success'=>true,'message'=>'Bid List','bid_info'=>$quoteBids]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
    }

    public function bid_update(Request $request,$id)
    {
        try{
			
            $bid = Bid::find($id);
            $bids = Bid::where('quote_id',$bid->quote_id)->get();

            if($request->status == 'reject')
            {
                $bid->update([
                    'status' => $request->status
                ]);
                return response()->json(['success'=>true,'message'=>'Updated Successfully','bid_info'=>$bid]);
            }
            else
            {

                foreach($bids as $row)
                {
                    if($row->id != $id)
                    {
                        $row->update([
                            'status' => 'reject'
                        ]);
                    }
                    
                }
                $bid->update([
                    'status' => $request->status
                ]);
                $quote = Quote::find($bid->quote_id);
                $quote->update([
                    'negotiator_id' => $bid->user_id,
                    'status' => 'onGoing'
                ]);
                return response()->json(['success'=>true,'message'=>'Updated Successfully','bid_info'=>$bid]);
            }
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
        return 'asd';
        
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
			
            $price = $request->quoted_price - $request->asking_price;
            $data = Quote::create([
                'user_id' => Auth::user()->id,
                'title' => $request->title,
                'state' => $request->state,
                'city' => $request->city,
                'quoted_price' => $request->quoted_price,
                'asking_price' => $request->asking_price,
                'negotiator_amount' => ($price * $request->offering_percentage) / 100,
                'offering_percentage' => $request->offering_percentage,
                'service_preference' => $request->service_preference,
                'notes' => $request->notes,
                'type' => 'quote',
            ]);

            
			if ($request->hasFile('images')) {
                $uploadedFiles = $request->file('images');
                $profileUrls = [];
            
                foreach ($uploadedFiles as $file) {
                    $fileName = md5($file->getClientOriginalName() . time()) . "Qbid." . $file->getClientOriginalExtension();
                    $file->move('uploads/quotes/', $fileName);
                    $profileUrls = asset('uploads/quotes/' . $fileName);

                    QuoteImage::create([
                        'quote_id' => $data->id,
                        'image' => $profileUrls
                    ]);
                }
            }
           $user = Quote::with('images')->where('user_id',Auth::user()->id)->get();

			return response()->json(['success'=>true,'message'=>'Quote Created Successfully','quote_info'=>$user]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		} 
        
    }
    
    public function hiring_store(Request $request)
    {
        try{
			
            $data = Quote::create([
                'user_id' => Auth::user()->id,
                'negotiator_id' => $request->negotiator_id,
                'title' => $request->title,
                'state' => $request->state,
                'city' => $request->city,
                'quoted_price' => $request->quoted_price,
                'asking_price' => $request->asking_price,
                'offering_percentage' => $request->offering_percentage,
                'notes' => $request->notes,
                'type' => 'specific',
            ]);

            
			if ($request->hasFile('images')) {
                $uploadedFiles = $request->file('images');
                $profileUrls = [];
            
                foreach ($uploadedFiles as $file) {
                    $fileName = md5($file->getClientOriginalName() . time()) . "Qbid." . $file->getClientOriginalExtension();
                    $file->move('uploads/quotes/', $fileName);
                    $profileUrls = asset('uploads/quotes/' . $fileName);

                    QuoteImage::create([
                        'quote_id' => $data->id,
                        'image' => $profileUrls
                    ]);
                }
            }
           $user = Quote::with('images')->where('user_id',Auth::user()->id)->get();

			return response()->json(['success'=>true,'message'=>'Hiring Created Successfully']);
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
        return 'show';
        
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
