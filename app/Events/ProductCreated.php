<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ProductCreated implements ShouldBroadcast
{
  use Dispatchable, InteractsWithSockets, SerializesModels;

  public $data = [];

  public function __construct($data = [])
  {
      $this->data = $data;
  }

  public function broadcastOn()
  {
      return ['product-created'];
  }

  public function broadcastAs()
  {
      return 'product-created';
  }

  public function broadcastWith()
  {
    $product  = $this->data;
        return [
            'message' => 'Product <b>'.$product->name.'</b> new added!', 
            'product' => $product, 
        
        ];
    }
}