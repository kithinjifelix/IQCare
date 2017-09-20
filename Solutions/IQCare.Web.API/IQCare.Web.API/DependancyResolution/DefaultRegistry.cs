using IQCare.Web.ApiLogic.Infrastructure.Context;
using IQCare.Web.ApiLogic.MessageHandler;
using StructureMap;
//using IQ.ApiLogic.Infrastructure.Context;

namespace IQCare.Web.API.DependancyResolution {
    public class DefaultRegistry : Registry {
        #region Constructors and Destructors

        public DefaultRegistry() {
            Scan(
                scan =>
                {
                    scan.TheCallingAssembly();
                    scan.Assembly("IQ.ApiLogic");
                    scan.WithDefaultConventions();
                    scan.With(new ControllerConvention());
                });

            For<ApiContext>().Use<ApiContext>()
                .SelectConstructor(() => new ApiContext());

            // section for registring services

            For<IOutgoingMessageService>()
                .Use<OutgoingMessageService>();

            For<IIncomingMessageService>()
                .Use<IncomingMessageService>();

        }

        #endregion
    }
}