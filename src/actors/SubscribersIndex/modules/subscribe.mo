import Errors "../../../common/errors";
import Map "mo:map/Map";
import Principal "mo:base/Principal";
import Subscribe "../../SubscribersStore/modules/subscribe";
import SubscribersStore "../../SubscribersStore/interface";
import { take; takeChain } "../../../utils/misc";
import { nhash; thash; phash } "mo:map/Map";
import { Types; State } "../../../migrations/types";

module {
  public type SubscriberResponse = Subscribe.SubscriberResponse;

  public type SubscriberParams = Subscribe.SubscriberParams;

  public type SubscriberFullParams = (caller: Principal, state: State.SubscribersIndexState, params: SubscriberParams);

  public func registerSubscriber((caller, state, (subscriberId, options)): SubscriberFullParams): async* SubscriberResponse {
    let subscriberStoreId = takeChain(
      Map.get(state.subscribersLocation, phash, subscriberId),
      state.subscribersStoreId,
      Errors.NO_SUBSCRIBERS_STORE_CANISTERS,
    );

    let subscribersStore = actor(Principal.toText(subscriberStoreId)):SubscribersStore.SubscribersStore;

    let response = await subscribersStore.registerSubscriber(subscriberId, options);

    Map.set(state.subscribersLocation, phash, subscriberId, subscriberStoreId);

    return response;
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public type SubscriptionResponse = Subscribe.SubscriptionResponse;

  public type SubscriptionParams = Subscribe.SubscriptionParams;

  public type SubscriptionFullParams = (caller: Principal, state: State.SubscribersIndexState, params: SubscriptionParams);

  public func subscribe((caller, state, (subscriberId, eventName, options)): SubscriptionFullParams): async* SubscriptionResponse {
    let subscriberStoreId = takeChain(
      Map.get(state.subscribersLocation, phash, subscriberId),
      state.subscribersStoreId,
      Errors.NO_SUBSCRIBERS_STORE_CANISTERS,
    );

    let subscribersStore = actor(Principal.toText(subscriberStoreId)):SubscribersStore.SubscribersStore;

    let response = await subscribersStore.subscribe(subscriberId, eventName, options);

    Map.set(state.subscribersLocation, phash, subscriberId, subscriberStoreId);

    return response;
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public type UnsubscribeResponse = Subscribe.UnsubscribeResponse;

  public type UnsubscribeParams = Subscribe.UnsubscribeParams;

  public type UnsubscribeFullParams = (caller: Principal, state: State.SubscribersIndexState, params: UnsubscribeParams);

  public func unsubscribe((caller, state, (subscriberId, eventName, options)): UnsubscribeFullParams): async* UnsubscribeResponse {
    let subscriberStoreId = take(Map.get(state.subscribersLocation, phash, subscriberId), Errors.SUBSCRIBER_NOT_FOUND);

    let subscribersStore = actor(Principal.toText(subscriberStoreId)):SubscribersStore.SubscribersStore;

    return await subscribersStore.unsubscribe(subscriberId, eventName, options);
  };
};