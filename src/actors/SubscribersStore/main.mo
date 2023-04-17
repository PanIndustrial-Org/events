import Config "./modules/config";
import Debug "mo:base/Debug";
import Errors "../../common/errors";
import Info "./modules/info";
import Listen "./modules/listen";
import MigrationTypes "../../migrations/types";
import Migrations "../../migrations";
import Stats "./modules/stats";
import Subscribe "./modules/subscribe";
import Supply "./modules/supply";
import { defaultArgs } "../../migrations";

shared (deployer) actor class SubscribersStore(
  subscribersIndexId: ?Principal,
  broadcastIds: ?[Principal],
) {
  stable var migrationState: MigrationTypes.StateList = #v0_0_0(#data(#SubscribersStore));

  migrationState := Migrations.migrate(migrationState, #v0_1_0(#id), {
    defaultArgs with
    mainId = ?deployer.caller;
    subscribersIndexId = subscribersIndexId;
    broadcastIds = broadcastIds;
  });

  let state = switch (migrationState) { case (#v0_1_0(#data(#SubscribersStore(state)))) state; case (_) Debug.trap(Errors.CURRENT_MIGRATION_STATE) };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public shared (context) func addBroadcastIds(params: Config.BroadcastIdsParams): async Config.BroadcastIdsResponse {
    return Config.addBroadcastIds(context.caller, state, params);
  };

  public query (context) func getCanisterMetrics(params: Config.CanisterMetricsParams): async Config.CanisterMetricsResponse {
    return Config.getCanisterMetrics(context.caller, state, params);
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public query (context) func getSubscriberInfo(params: Info.SubscriberInfoParams): async Info.SubscriberInfoResponse {
    return Info.getSubscriberInfo(context.caller, state, params);
  };

  public query (context) func getSubscriptionInfo(params: Info.SubscriptionInfoParams): async Info.SubscriptionInfoResponse {
    return Info.getSubscriptionInfo(context.caller, state, params);
  };

  public query (context) func getSubscriptionStats(params: Info.SubscriptionStatsParams): async Info.SubscriptionStatsResponse {
    return Info.getSubscriptionStats(context.caller, state, params);
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public shared (context) func confirmListener(params: Listen.ConfirmListenerParams): async Listen.ConfirmListenerResponse {
    return Listen.confirmListener(context.caller, state, params);
  };

  public shared (context) func removeListener(params: Listen.RemoveListenerParams): async Listen.RemoveListenerResponse {
    return Listen.removeListener(context.caller, state, params);
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public shared (context) func mergeSubscriptionStats(params: Stats.MergeStatsParams): async Stats.MergeStatsResponse {
    return Stats.mergeSubscriptionStats(context.caller, state, params);
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public shared (context) func registerSubscriber(params: Subscribe.SubscriberParams): async Subscribe.SubscriberResponse {
    return Subscribe.registerSubscriber(context.caller, state, params);
  };

  public shared (context) func subscribe(params: Subscribe.SubscriptionParams): async Subscribe.SubscriptionResponse {
    return Subscribe.subscribe(context.caller, state, params);
  };

  public shared (context) func unsubscribe(params: Subscribe.UnsubscribeParams): async Subscribe.UnsubscribeResponse {
    return Subscribe.unsubscribe(context.caller, state, params);
  };

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public query (context) func supplySubscribersBatch(params: Supply.SubscribersBatchParams): async Supply.SubscribersBatchResponse {
    return Supply.supplySubscribersBatch(context.caller, state, params);
  };
};
