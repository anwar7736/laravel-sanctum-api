<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ProductUpdated implements ShouldBroadcast
{
  use Dispatchable, InteractsWithSockets, SerializesModels;

  public $data = [];

  public function __construct($data = [])
  {
      $this->data = $data;
  }

  public function broadcastOn()
  {
      return ['product-updated'];
  }

  public function broadcastAs()
  {
      return 'product-updated';
  }

  public function broadcastWith()
  {
    $product  = $this->data;
        return [
            'message' => 'Product <b>'.$product->name.'</b> has been updated!', 
            'product' => $product, 
        
        ];
    }
}