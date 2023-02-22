@forelse($users as $user)
<a class="text-light" href="{{ route('user.list', ['query'=>$user->name]) }}">{{ $user->name }}</a><br/>
@empty
<p><center>No Data Found!</center></p>
@endforelse
{{User::total_user()}}
{{User::first_user()}}
{{User::last_user()}}